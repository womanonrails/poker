require 'spec_helper'

describe Rules::RoyalnessRule do
  it 'check if array has royal order' do
    royalness_rule = described_class.new([8, 9, 10, 11, 12])
    expect(royalness_rule).to be_check
  end

  it 'check if array has not royal order' do
    royalness_rule = described_class.new([8, 9, 10, 7, 12])
    expect(royalness_rule).to_not be_check
  end
end
