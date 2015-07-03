require 'spec_helper'

describe Poker::OnePair do
  [
    [0, 7, 8, 36, 37],
    [0, 40, 41, 44, 48],
    [0, 8, 12, 44, 45],
    [1, 9, 13, 48, 50],
    [7, 19, 22, 38, 39],
    [46, 47, 51, 43, 0].shuffle,
    [46, 44, 16, 48, 0].shuffle,
    [49, 50, 0, 7, 9].shuffle,
    [37, 39, 1, 13, 21].shuffle,
    [48, 49, 0, 39, 18].shuffle
  ].each do |cards|
    it "detects pair for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :one_pair
    end
  end
end
