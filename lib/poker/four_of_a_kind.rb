module Poker
  class FourOfAKind
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
    end

    def check
      :four_of_a_kind if @normalize_array.figures_frequency.include?(4)
    end
  end
end
