# frozen_string_literal: true

require 'spec_helper'

describe Poker::RoyalFlush do
  StubNormalization = Struct.new(:figures, :colors)

  [
    { figures: [8, 9, 10, 11, 12], colors: [0, 0, 0, 0, 0] },
    { figures: [8, 9, 10, 11, 12], colors: [1, 1, 1, 1, 1] },
    { figures: [8, 9, 10, 11, 12], colors: [2, 2, 2, 2, 2] },
    { figures: [8, 9, 10, 11, 12], colors: [3, 3, 3, 3, 3] }
  ].each do |cards|
    figures = cards[:figures]
    colors = cards[:colors]
    it "detects royal_flush for figures #{cards[:figures]} and color #{cards[:colors].first}" do
      normalization = StubNormalization.new(figures, colors)
      allow(normalization).to receive(:new).and_return(normalization)
      hand = described_class.new(cards, normalization)
      expect(hand.check).to eq :royal_flush
    end
  end

  [
    { figures: [7, 9, 10, 11, 12], colors: [0, 0, 0, 0, 0] },
    { figures: [8, 9, 11, 11, 12], colors: [1, 1, 1, 1, 1] },
    { figures: [8, 9, 10, 11, 12], colors: [2, 1, 2, 2, 2] },
    { figures: [8, 9, 10, 11, 12], colors: [3, 2, 3, 3, 3] }
  ].each do |cards|
    figures = cards[:figures]
    colors = cards[:colors]
    it "does not detect royal_flush for figures #{cards[:figures]} and color #{cards[:colors].first}" do
      normalization = StubNormalization.new(figures, colors)
      allow(normalization).to receive(:new).and_return(normalization)
      hand = described_class.new(cards, normalization)
      expect(hand.check).to_not eq :royal_flush
    end
  end
end
