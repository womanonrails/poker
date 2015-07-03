require 'spec_helper'

describe Poker::ThreeOfAKind do
  [
    [0, 1, 2, 4, 8],
    [4, 5, 6, 8, 12],
    [8, 9, 10, 12, 16],
    [12, 13, 14, 16, 20],
    [16, 17, 18, 20, 24],
    [20, 21, 22, 24, 28].shuffle,
    [24, 25, 26, 28, 32].shuffle,
    [28, 29, 30, 32, 37].shuffle,
    [32, 33, 34, 0, 4].shuffle,
    [51, 50, 49, 0, 14].shuffle
  ].each do |cards|
    it "detects three_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :three_of_a_kind
    end
  end
end
