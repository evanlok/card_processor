require 'spec_helper'

RSpec.describe CardProcessor::Account do
  let(:account) { CardProcessor::Account.new('John', 4111111111111111, 500) }

  describe '#charge' do
    it 'adds to balance' do
      account.charge(100)
      expect(account.balance).to eq(100)
    end

    context 'when charge amount is greater than available balance' do
      it 'does not affect balance' do
        account.charge(800)
        expect(account.balance).to eq(0)
      end
    end

    context 'when credit card number is invalid' do
      let(:account) { CardProcessor::Account.new('John', 12345, 500) }

      it 'does not charge account' do
        account.charge(100)
        expect(account.balance).to eq(0)
      end
    end
  end

  describe '#credit' do
    let(:account) { CardProcessor::Account.new('John', 4111111111111111, 500, 100) }

    it 'subtracts from balance' do
      account.credit(50)
      expect(account.balance).to eq(50)
    end

    context 'when credit is greater than balance' do
      it 'sets negative balance' do
        account.credit(200)
        expect(account.balance).to eq(-100)
      end
    end

    context 'when credit card number is invalid' do
      let(:account) { CardProcessor::Account.new('John', 12345, 500) }

      it 'does not charge account' do
        account.credit(100)
        expect(account.balance).to eq(0)
      end
    end
  end
end
