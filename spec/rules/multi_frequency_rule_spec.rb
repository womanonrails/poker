require 'spec_helper'

describe Rules::MultiFrequencyRule do
  it 'check if array has number' do
    frequency_rule = described_class.new([1, 2, 3, 4], 3)
    expect(frequency_rule).to be_check
  end

  it 'check if array have lower number when have bigger number' do
    frequency_rule = described_class.new([1, 3, 4], 2)
    expect(frequency_rule).to be_check
  end

  it 'check if array has number 3 times' do
    frequency_rule = described_class.new([1, 1, 1, 4], 1, 3)
    expect(frequency_rule).to be_check
  end

  it 'check if array have lower number at least 2 times' do
    frequency_rule = described_class.new([1, 3, 4], 2, 2)
    expect(frequency_rule).to be_check
  end

  it 'check if array has number 2 times' do
    frequency_rule = described_class.new([1, 1, 4, 4], 4, 2)
    expect(frequency_rule).to be_check
  end

  it 'check if array has number 3 times or more' do
    frequency_rule = described_class.new([2, 2, 3, 4], 2, 3)
    expect(frequency_rule).to be_check
  end

  it 'check if array have 4 then have 2 times 2' do
    frequency_rule = described_class.new([1, 4], 2, 2)
    expect(frequency_rule).to be_check
  end

  it 'check if array has not number 3 times' do
    frequency_rule = described_class.new([2, 2, 1, 1], 2, 3)
    expect(frequency_rule).to_not be_check
  end

  it 'check if array has not number 2 times' do
    frequency_rule = described_class.new([2, 2, 3, 4], 5, 2)
    expect(frequency_rule).to_not be_check
  end

  it 'check if array has not number' do
    frequency_rule = described_class.new([1, 2, 3, 4], 5)
    expect(frequency_rule).to_not be_check
  end
end
