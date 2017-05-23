module Poker
  class Flush
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
      @rule = Rules::FlushnessRule.new(@normalize_array.colors)
    end

    def check
      :flush if @rule.check?
    end
  end
end
