module Poker
  class ThreeOfAKind
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::FrequencyRule.new(@normalize_array.figures_frequency, 3)
    end

    def check
      :three_of_a_kind if @rule.check?
    end
  end
end
