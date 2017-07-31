# frozen_string_literal: true

require 'spec_helper'

describe Poker::FullHouse do
  [
    [0, 0, 0, 1, 1],
    [1, 2, 1, 2, 2]
  ].each do |cards|
    it "detects four_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :full_house
    end
  end

  [
    [0, 0, 0, 1, 2],
    [1, 2, 3, 2, 2]
  ].each do |cards|
    it "does not detect four_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :full_house
    end
  end
end
