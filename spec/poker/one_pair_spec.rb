require 'spec_helper'

describe Poker::OnePair do
  [
    [0, 1, 2, 9, 9],
    [0, 10, 10, 11, 12],
    [0, 2, 5, 11, 11],
    [0, 2, 3, 12, 12],
    [1, 4, 5, 9, 9],
    [11, 11, 12, 10, 0].shuffle,
    [11, 11, 4, 12, 0].shuffle,
    [12, 12, 0, 1, 2].shuffle,
    [9, 9, 0, 3, 5].shuffle,
    [12, 12, 0, 9, 4].shuffle
  ].each do |cards|
    it "detects pair for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :one_pair
    end
  end
end
