module Poker
  class OnePair
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::FrequencyRule.new(@normalize_array.figures_frequency, 2)
    end

    def check
      :one_pair if @rule.check?
    end
  end
end
