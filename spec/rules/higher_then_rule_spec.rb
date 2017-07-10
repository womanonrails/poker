require 'spec_helper'

describe Rules::HigherThenRule do
  it 'check if array has at least one element higher then 9' do
    heiger_then_rule = described_class.new([10, 0, 1, 2, 3], 9)
    expect(heiger_then_rule).to be_check
  end

  it 'check if array has all elements lower then 9' do
    heiger_then_rule = described_class.new([8, 9, 7, 5], 9)
    expect(heiger_then_rule).to_not be_check
  end
end
