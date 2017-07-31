# frozen_string_literal: true

require 'spec_helper'

describe Normalization do
  it 'show frequency of figures' do
    cards = described_class.new([0, 7, 8, 36, 36])
    expect(cards.figures_frequency).to eq [1, 1, 1, 2]
  end
end
