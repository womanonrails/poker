# frozen_string_literal: true

require 'spec_helper'

describe Poker::StraightFlush do
  StubNormalization = Struct.new(:figures, :colors)

  [
    { figures: [0, 1, 2, 3, 4], colors: [0, 0, 0, 0, 0] },
    { figures: [1, 2, 3, 4, 5], colors: [1, 1, 1, 1, 1] },
    { figures: [2, 3, 4, 5, 6], colors: [2, 2, 2, 2, 2] },
    { figures: [3, 4, 5, 6, 7], colors: [3, 3, 3, 3, 3] }
  ].each do |cards|
    figures = cards[:figures]
    colors = cards[:colors]
    it "detects straight_flush for figures #{cards[:figures]} and color #{cards[:colors].first}" do
      normalization = StubNormalization.new(figures, colors)
      allow(normalization).to receive(:new).and_return(normalization)
      hand = described_class.new(cards, normalization)
      expect(hand.check).to eq :straight_flush
    end
  end

  [
    { figures: [0, 1, 2, 3, 5], colors: [0, 0, 0, 0, 0] },
    { figures: [1, 2, 4, 5, 6], colors: [1, 1, 1, 1, 1] },
    { figures: [2, 3, 4, 5, 6], colors: [2, 1, 2, 2, 2] },
    { figures: [3, 4, 5, 6, 7], colors: [3, 3, 2, 3, 3] }
  ].each do |cards|
    figures = cards[:figures]
    colors = cards[:colors]
    it "does not detect straight_flush for figures #{cards[:figures]} and color #{cards[:colors].first}" do
      normalization = StubNormalization.new(figures, colors)
      allow(normalization).to receive(:new).and_return(normalization)
      hand = described_class.new(cards, normalization)
      expect(hand.check).to_not eq :straight_flush
    end
  end
end
