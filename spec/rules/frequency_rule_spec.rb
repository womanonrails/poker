require 'spec_helper'

describe Rules::FrequencyRule do
  it 'check if array has number' do
    frequency_rule = described_class.new([1, 2, 3, 4], 3)
    expect(frequency_rule).to be_check
  end

  it 'check if array has not number' do
    frequency_rule = described_class.new([1, 2, 3, 4], 5)
    expect(frequency_rule).to_not be_check
  end
end
