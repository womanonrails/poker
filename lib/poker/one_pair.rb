module Poker
  class OnePair
    def initialize(array)
      @array = array.sort
      @figures, @colors = cards_figures_and_colors
      @frequency = cards_frequency.values
    end

    def check
      :one_pair if @frequency.include?(2)
    end

    private

    def cards_figures_and_colors
      @array.map { |item| [item / 4, item % 4] }.transpose
    end

    def cards_frequency
      @figures.each_with_object(Hash.new(0)) do |item, hash|
        hash[item] += 1
      end
    end
  end
end
