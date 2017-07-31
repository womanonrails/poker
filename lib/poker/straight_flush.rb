# frozen_string_literal: true

module Poker
  class StraightFlush
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      rule1 = Rules::FlushnessRule.new(@normalize_array.colors)
      rule2 = Rules::StraightnessRule.new(@normalize_array.figures)
      @rules = RulesFactory.new(rule1, rule2)
    end

    def check
      :straight_flush if @rules.check?
    end
  end
end
