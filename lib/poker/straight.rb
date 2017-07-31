# frozen_string_literal: true

module Poker
  class Straight
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::StraightnessRule.new(@normalize_array.figures)
    end

    def check
      :straight if @rule.check?
    end
  end
end
