require 'spec_helper'

describe Rules::HigherThenRule do
  it 'check if array has all elements higher then 9' do
    heiger_then_rule = described_class.new([10, 11, 12, 13], 9)
    expect(heiger_then_rule).to be_check
  end

  it 'check if array has at leaft one element lower then 9' do
    heiger_then_rule = described_class.new([10, 9, 12, 13], 9)
    expect(heiger_then_rule).to_not be_check
  end
end
