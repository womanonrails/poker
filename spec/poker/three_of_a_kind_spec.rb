require 'spec_helper'

describe Poker::ThreeOfAKind do
  [
    [0, 0, 0, 1, 3],
    [1, 1, 1, 2, 3],
    [2, 2, 2, 3, 4],
    [3, 3, 3, 4, 5],
    [4, 4, 4, 5, 6],
    [5, 5, 5, 6, 7].shuffle,
    [6, 6, 6, 7, 8].shuffle,
    [7, 7, 7, 8, 9].shuffle,
    [8, 8, 8, 0, 1].shuffle,
    [12, 12, 12, 0, 3].shuffle
  ].each do |cards|
    it "detects three_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :three_of_a_kind
    end
  end
end
