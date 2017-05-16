require 'spec_helper'

describe Poker::Straight do
  [
    [0, 1, 2, 3, 4],
    [1, 2, 3, 4, 5],
    [3, 4, 5, 6, 7],
    [4, 5, 6, 7, 8],
    [8, 9, 10, 11, 12].shuffle,
    [0, 1, 2, 3, 12].shuffle,
    [7, 8, 9, 10, 11].shuffle,
  ].each do |cards|
    it "detects straight for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :straight
    end
  end

  [
    [0, 1, 3, 4, 5],
    [4, 5, 6, 7, 9],
    [1, 2, 3, 4, 12].shuffle,
    [7, 8, 10, 10, 11].shuffle,
  ].each do |cards|
    it "does not detect straight for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :straight
    end
  end
end
