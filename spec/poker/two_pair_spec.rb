require 'spec_helper'

describe Poker::TwoPair do
  [
    [0, 0, 1, 1, 4],
    [1, 1, 2, 2, 5],
    [2, 2, 3, 3, 4],
    [3, 3, 4, 4, 5],
    [4, 4, 5, 5, 6],
    [4, 5, 5, 5, 5],
    [2, 2, 3, 3, 3]
  ].each do |cards|
    it "detects two_pair for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :two_pair
    end
  end

  [
    [0, 1, 1, 4, 5],
    [3, 3, 4, 5, 6],
    [4, 4, 5, 6, 7],
    [5, 5, 6, 7, 8],
    [6, 6, 7, 8, 9],
    [4, 5, 6, 8, 9]
  ].each do |cards|
    it "detects two_pair for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :two_pair
    end
  end
end
