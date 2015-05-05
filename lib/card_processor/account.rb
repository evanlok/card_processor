require 'luhn'

module CardProcessor
  class Account
    attr_reader :name, :card_number, :limit, :balance

    def initialize(name, card_number, limit, balance = 0)
      @name = name
      @card_number = card_number
      @limit = limit
      @balance = balance
    end

    def charge(amount)
      return unless valid_card_number?
      new_balance = balance + amount
      @balance = new_balance if new_balance <= limit
    end

    def credit(amount)
      return unless valid_card_number?
      @balance -= amount
    end

    def valid_card_number?
      Luhn.valid?(card_number)
    end
  end
end
