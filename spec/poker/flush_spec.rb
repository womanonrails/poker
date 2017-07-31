# frozen_string_literal: true

require 'spec_helper'

describe Poker::Flush do
  [
    [0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [3, 3, 3, 3, 3]
  ].each do |cards|
    it "detects flush for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :flush
    end
  end

  [
    [0, 2, 0, 0, 0],
    [1, 1, 3, 1, 2],
    [2, 2, 2, 2, 3],
    [3, 1, 3, 3, 3]
  ].each do |cards|
    it "does not detect flush for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :flush
    end
  end
end
