# frozen_string_literal: true

module Poker
  class TwoPair
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::MultiFrequencyRule.new(
        @normalize_array.figures_frequency, 2, 2
      )
    end

    def check
      :two_pair if @rule.check?
    end
  end
end
