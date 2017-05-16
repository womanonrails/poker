require 'spec_helper'

describe Rules::StraightnessRule do
  it 'check if array has straight order' do
    straightness_rule = described_class.new([1, 2, 3, 4, 5])
    expect(straightness_rule).to be_check
  end

  it 'check if array has not straight order' do
    straightness_rule = described_class.new([1, 2, 3, 5, 6])
    expect(straightness_rule).to_not be_check
  end
end
