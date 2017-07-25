require 'spec_helper'

describe Poker::ThreeOfAKind do
  [
    [0, 0, 0, 1, 3],
    [12, 0, 12, 12, 3],
    [1, 1, 1, 3, 1]
  ].each do |cards|
    it "detects three_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :three_of_a_kind
    end
  end

  [
    [0, 0, 1, 1, 3],
    [12, 0, 1, 12, 3]
  ].each do |cards|
    it "detects three_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :three_of_a_kind
    end
  end
end
