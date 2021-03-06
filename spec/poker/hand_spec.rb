# frozen_string_literal: true

require 'spec_helper'

describe Poker::Hand do
  it 'generates cards properly' do
    hand = described_class.new([0, 1, 2, 3, 4])
    expect(hand.check).not_to be_nil
  end

  [
    [32, 36, 40, 44, 48],
    [35, 39, 43, 47, 51].shuffle,
    [49, 45, 41, 37, 33].shuffle
  ].each do |cards|
    it "detects royal_flush for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :royal_flush
    end
  end

  [
    [32, 37, 40, 44, 48],
    [35, 38, 43, 47, 51].shuffle,
    [49, 45, 40, 37, 33].shuffle
  ].each do |cards|
    it "does not detect royal_flush for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to_not eq :royal_flush
    end
  end

  [
    [0, 4, 8, 12, 16],
    [5, 9, 13, 17, 21],
    [10, 14, 18, 22, 26],
    [15, 19, 23, 27, 31],
    [16, 20, 24, 28, 32],
    [37, 29, 33, 21, 25].shuffle,
    [30, 34, 38, 26, 42].shuffle,
    [31, 35, 47, 43, 39].shuffle
  ].each do |cards|
    it "detects straight_flush for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :straight_flush
    end
  end

  it 'detects four_of_a_kind' do
    hand = described_class.new([0, 1, 2, 3, 4])
    expect(hand.check).to eq :four_of_a_kind
  end

  [
    [1, 2, 3, 4, 5],
    [5, 6, 7, 8, 9],
    [9, 10, 11, 12, 13],
    [13, 14, 15, 16, 17],
    [17, 18, 19, 20, 21],
    [21, 22, 23, 24, 25].shuffle,
    [25, 26, 27, 28, 29].shuffle,
    [30, 31, 32, 33, 34].shuffle,
    [34, 35, 36, 37, 38].shuffle,
    [38, 39, 40, 41, 42].shuffle
  ].each do |cards|
    it "detects full_house for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :full_house
    end
  end

  [
    [0, 4, 8, 12, 20],
    [5, 9, 13, 17, 25],
    [10, 14, 18, 22, 30],
    [15, 19, 23, 27, 35],
    [16, 20, 24, 28, 36],
    [21, 25, 29, 33, 41].shuffle,
    [26, 30, 2, 6, 14].shuffle,
    [3, 7, 15, 51, 39].shuffle,
    [2, 50, 22, 30, 10].shuffle,
    [49, 41, 29, 17, 13].shuffle
  ].each do |cards|
    it "detects flush for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :flush
    end
  end

  [
    [0, 5, 10, 15, 18],
    [0, 5, 10, 15, 48],
    [4, 9, 14, 19, 22],
    [8, 13, 18, 23, 26],
    [12, 17, 22, 27, 30],
    [16, 21, 26, 31, 34],
    [49, 46, 43, 38, 33].shuffle,
    [1, 6, 9, 15, 50].shuffle,
    [45, 42, 39, 34, 29].shuffle,
    [41, 38, 35, 30, 25].shuffle,
    [37, 34, 31, 26, 21].shuffle,
    [34, 31, 26, 21, 16].shuffle
  ].each do |cards|
    it "detects straight for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :straight
    end
  end

  it 'detects three_of_a_kind' do
    hand = described_class.new([0, 1, 2, 4, 8])
    expect(hand.check).to eq :three_of_a_kind
  end

  [
    [0, 1, 4, 5, 8],
    [4, 5, 8, 9, 12],
    [8, 9, 12, 13, 16],
    [12, 13, 16, 17, 20],
    [16, 17, 20, 21, 24],
    [20, 21, 24, 25, 28].shuffle,
    [24, 25, 28, 29, 32].shuffle,
    [28, 29, 32, 33, 37].shuffle,
    [32, 33, 36, 37, 40].shuffle,
    [36, 37, 40, 41, 44].shuffle
  ].each do |cards|
    it "detects two_pair for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :two_pair
    end
  end

  it 'detects pair' do
    hand = described_class.new([0, 7, 8, 36, 37])
    expect(hand.check).to eq :one_pair
  end

  [
    [0, 7, 8, 12, 37],
    [0, 40, 19, 44, 48],
    [0, 8, 12, 19, 45],
    [1, 9, 13, 19, 50],
    [7, 19, 22, 1, 39],
    [46, 21, 51, 43, 0].shuffle,
    [46, 21, 16, 48, 0].shuffle,
    [49, 21, 0, 7, 9].shuffle,
    [2, 39, 29, 13, 21].shuffle,
    [48, 21, 0, 39, 18].shuffle
  ].each do |cards|
    it "detects high_card for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :high_card
    end
  end

  [
    [0, 10, 18, 24, 34],
    [4, 24, 22, 28, 8],
    [8, 28, 26, 32, 2],
    [12, 32, 19, 6, 1],
    [16, 29, 34, 0, 9],
    [0, 10, 18, 24, 34].shuffle,
    [4, 24, 22, 28, 8].shuffle,
    [8, 28, 26, 32, 2].shuffle,
    [12, 0, 19, 34, 6].shuffle,
    [16, 0, 34, 20, 9].shuffle
  ].each do |cards|
    it "detects none for #{cards}" do
      hand = described_class.new(cards)
      expect(hand.check).to eq :none
    end
  end
end
