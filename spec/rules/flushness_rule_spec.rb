# frozen_string_literal: true

require 'spec_helper'

describe Rules::FlushnessRule do
  it 'check if array has one color' do
    flushness_rule = described_class.new([1, 1, 1, 1])
    expect(flushness_rule).to be_check
  end

  it 'check if array has not one color' do
    flushness_rule = described_class.new([2, 3, 2, 2])
    expect(flushness_rule).to_not be_check
  end
end
