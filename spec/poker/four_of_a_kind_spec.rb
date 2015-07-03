require 'spec_helper'

describe Poker::FourOfAKind do
  [
    [0, 1, 2, 3, 4],
    [4, 5, 6, 0, 7],
    [8, 9, 0, 10, 11],
    [12, 0, 13, 14, 15],
    [0, 16, 17, 18, 19],
    [20, 21, 22, 23, 0].shuffle,
    [24, 25, 26, 27, 0].shuffle,
    [28, 29, 30, 31, 0].shuffle,
    [32, 33, 34, 35, 0].shuffle,
    [36, 37, 38, 39, 0].shuffle
  ].each do |cards|
    it "detects four_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :four_of_a_kind
    end
  end
end
