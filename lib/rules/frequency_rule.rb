# frozen_string_literal: true

module Rules
  class FrequencyRule
    def initialize(frequency_array, count)
      @frequency_array = frequency_array
      @count = count
    end

    def check?
      @frequency_array.include?(@count)
    end
  end
end
