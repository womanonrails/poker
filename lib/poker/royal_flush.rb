module Poker
  class RoyalFlush
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      rule1 = Rules::FlushnessRule.new(@normalize_array.colors)
      rule2 = Rules::RoyalnessRule.new(@normalize_array.figures)
      @rules = RulesFactory.new(rule1, rule2)
    end

    def check
      :royal_flush if @rules.check?
    end
  end
end
