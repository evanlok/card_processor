require 'spec_helper'

RSpec.describe CardProcessor::Parser do
  let(:input) do
    <<-INPUT
Add Tom 4111111111111111 $1000
Add Lisa 5454545454545454 $3000
Add Quincy 1234567890123456 $2000
Charge Tom $500
Charge Tom $800
Charge Lisa $7
Credit Lisa $100
Credit Quincy $200
    INPUT
  end

  let(:summary) do
    <<-OUTPUT
Lisa: $-93
Quincy: error
Tom: $500
    OUTPUT
  end

  let(:parser) { CardProcessor::Parser.new(input) }

  describe '#run' do
    it 'parses input and prints summary' do
      parser.run
      expect { parser.run }.to output(summary).to_stdout
    end
  end
end
