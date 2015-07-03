require 'spec_helper'

describe Poker::FourOfAKind do
  [
    [0, 0, 0, 0, 1],
    [1, 1, 1, 0, 1],
    [2, 2, 0, 2, 2],
    [3, 0, 3, 3, 3],
    [0, 4, 4, 4, 4],
    [5, 5, 5, 5, 0].shuffle,
    [6, 6, 6, 6, 0].shuffle,
    [7, 7, 7, 7, 0].shuffle,
    [8, 8, 8, 8, 0].shuffle,
    [9, 9, 9, 9, 0].shuffle
  ].each do |cards|
    it "detects four_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :four_of_a_kind
    end
  end
end
