# frozen_string_literal: true

module Rules
  class StraightnessRule
    def initialize(figure_array)
      @figure_array = figure_array
    end

    def check?
      straight_with_ace? || normal_straight?
    end

    private

    def straight_with_ace?
      @figure_array == [0, 1, 2, 3, 12]
    end

    def normal_straight?
      @figure_array.each_cons(2) do |previous, current|
        return false unless previous + 1 == current
      end
      true
    end
  end
end
