require 'spec_helper'

describe CardsNormalization do
  it 'show figures' do
    cards = described_class.new([0, 7, 8, 36, 37])
    expect(cards.figures).to eq [0, 1, 2, 9, 9]
  end

  it 'show figures in right order' do
    cards = described_class.new([46, 47, 51, 43, 0])
    expect(cards.figures).to eq [0, 10, 11, 11, 12]
  end

  it 'show colors' do
    cards = described_class.new([46, 47, 51, 43, 0])
    expect(cards.colors).to eq [0, 3, 2, 3, 3]
  end
end
