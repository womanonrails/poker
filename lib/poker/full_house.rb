# frozen_string_literal: true

module Poker
  class FullHouse
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      rule1 = Rules::FrequencyRule.new(@normalize_array.figures_frequency, 2)
      rule2 = Rules::FrequencyRule.new(@normalize_array.figures_frequency, 3)
      @rules = RulesFactory.new(rule1, rule2)
    end

    def check
      :full_house if @rules.check?
    end
  end
end
