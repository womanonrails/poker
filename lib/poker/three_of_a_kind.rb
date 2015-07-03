module Poker
  class ThreeOfAKind
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
    end

    def check
      :three_of_a_kind if @normalize_array.figures_frequency.include?(3)
    end
  end
end
