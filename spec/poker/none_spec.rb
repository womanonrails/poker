# frozen_string_literal: true

require 'spec_helper'

describe Poker::None do
  [
    [0, 10, 18, 24, 34],
    [4, 8, 22, 24, 28],
    [2, 8, 26, 28, 32]
  ].each do |cards|
    it "detects none for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :none
    end
  end
end
