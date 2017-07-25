module Rules
  class MultiFrequencyRule
    def initialize(frequency_array, count, times = 1)
      @frequency_array = frequency_array
      @count = count
      @times = times
    end

    def check?
      selected_frequency = @frequency_array.map { |number| number / @count }
      selected_frequency.sum >= @times
    end
  end
end
