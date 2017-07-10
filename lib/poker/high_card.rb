module Poker
  class HighCard
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::HigherThenRule.new(@normalize_array.figures, 8)
    end

    def check
      :high_card if @rule.check?
    end
  end
end
