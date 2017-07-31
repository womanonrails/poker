# frozen_string_literal: true

module Rules
  class RoyalnessRule
    def initialize(array)
      @array = array
    end

    def check?
      @array == [8, 9, 10, 11, 12]
    end
  end
end
