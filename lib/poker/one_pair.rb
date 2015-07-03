module Poker
  class OnePair
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
    end

    def check
      :one_pair if @normalize_array.figures_frequency.include?(2)
    end
  end
end
