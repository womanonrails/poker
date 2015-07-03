require 'spec_helper'

describe RulesFactory do
  context 'check rules' do
    it 'when rules are empty' do
      rules = described_class.new
      expect(rules).to be_check
    end

    it 'when have one rule' do
      rule = double
      allow(rule).to receive(:check?) { true }
      rules = described_class.new(rule)
      expect(rules).to be_check
    end

    it 'when have many rules' do
      true_rule = double
      allow(true_rule).to receive(:check?) { true }

      false_rule = double
      allow(false_rule).to receive(:check?) { false }

      rules = described_class.new(true_rule, false_rule)
      expect(rules).to_not be_check
    end
  end
end
