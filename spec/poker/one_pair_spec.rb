require 'spec_helper'

describe Poker::OnePair do
  [
    [0, 1, 2, 9, 9],
    [0, 10, 10, 11, 12],
    [11, 12, 10, 11, 0]
  ].each do |cards|
    it "detects pair for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :one_pair
    end
  end
end
