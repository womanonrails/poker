module Rules
  class HigherThenRule
    def initialize(figure_array, higher_then)
      @figure_array = figure_array
      @higher_then = higher_then
    end

    def check?
      @figure_array.any? { |number| number > @higher_then }
    end
  end
end
