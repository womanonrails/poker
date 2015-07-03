require 'pry'

module Poker
  # Poker hand
  class Hand
    def initialize(array)
      @array = array.sort
      @figures, @colors = cards_figures_and_colors
      @frequency = cards_frequency.values
    end

    def check
      return 9 if straight_flush?
      return 8 if four_of_a_kind?
      return 7 if full_house?
      return 6 if flush?
      return 5 if straight?
      return 4 if three_of_a_kind?
      return 3 if two_pair?
      return 2 if one_pair?
      return 1 if high_card?
      return 0
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

    def four_of_a_kind?
      @frequency.include?(4)
    end

    def three_of_a_kind?
      @frequency.include?(3)
    end

    def one_pair?
      @frequency.include?(2)
    end

    def straight_flush?
      straight? && flush?
    end

    def full_house?
      three_of_a_kind? && one_pair?
    end

    def flush?
      @colors.uniq.size == 1
    end

    def straight?
      [0, 1, 2, 3, 12] == @figures || normal_straight?
    end

    def normal_straight?
      @figures.each_cons(2) do |previous, current|
        return false unless previous + 1 == current
      end
      true
    end

    def two_pair?
      (@frequency - [2]).size == 1
    end

    def high_card?
      @figures.last >= 9
    end
  end
end
