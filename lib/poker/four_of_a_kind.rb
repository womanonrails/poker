module Poker
  class FourOfAKind
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::MultiFrequencyRule.new(@normalize_array.figures_frequency, 4)
    end

    def check
      :four_of_a_kind if @rule.check?
    end
  end
end
