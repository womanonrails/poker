# frozen_string_literal: true

module Rules
  class FlushnessRule
    def initialize(color_array)
      @color_array = color_array
    end

    def check?
      @color_array.uniq.size == 1
    end
  end
end
