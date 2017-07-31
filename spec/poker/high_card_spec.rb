# frozen_string_literal: true

require 'spec_helper'

describe Poker::HighCard do
  [
    [9, 10, 11, 12, 13],
    [9, 9, 9, 9, 10],
    [10, 9, 10, 11, 12],
    [1, 9, 2, 3, 4]
  ].each do |cards|
    it "detects high_card for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :high_card
    end
  end

  [
    [0, 7, 8, 4, 3],
    [8, 8, 8, 1, 2],
    [0, 1, 2, 3, 4, 5]
  ].each do |cards|
    it "does not detect high_card for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :high_card
    end
  end
end
