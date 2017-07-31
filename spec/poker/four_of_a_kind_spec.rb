# frozen_string_literal: true

require 'spec_helper'

describe Poker::FourOfAKind do
  [
    [0, 0, 0, 0, 1],
    [2, 2, 0, 2, 2],
    [1, 1, 1, 1, 1]
  ].each do |cards|
    it "detects four_of_a_kind for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :four_of_a_kind
    end
  end
end
