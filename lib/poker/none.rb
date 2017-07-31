# frozen_string_literal: true

module Poker
  class None
    def initialize(array, normalization = Normalization)
      @normalize_array = normalization.new(array)
    end

    def check
      :none
    end
  end
end
