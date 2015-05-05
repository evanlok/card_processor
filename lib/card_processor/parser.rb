module CardProcessor
  class Parser
    def initialize(input)
      @input = input
      @accounts = {}
    end

    def run
      @input.each_line { |line| process_line(line) }

      @accounts.sort_by { |name, account| name }.each do |name, account|
        if account.valid_card_number?
          puts "#{name}: $#{account.balance}"
        else
          puts "#{name}: error"
        end
      end
    end

    private

    def process_line(line)
      command, *args = line.split(' ')

      case command
        when 'Add'
          create_account(*args)
        when 'Charge'
          charge_account(*args)
        when 'Credit'
          credit_account(*args)
      end
    end

    def create_account(name, card_number, limit)
      limit.sub!('$', '')
      @accounts[name] = CardProcessor::Account.new(name, card_number.to_i, limit.to_i)
    end

    def charge_account(name, amount)
      amount.sub!('$', '')
      @accounts[name].charge(amount.to_i)
    end

    def credit_account(name, amount)
      amount.sub!('$', '')
      @accounts[name].credit(amount.to_i)
    end
  end
end
