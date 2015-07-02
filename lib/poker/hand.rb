require 'pry'

module Poker
  # Poker hand
  class Hand
    def initialize(array)
      @array = array.sort
      @cards = @array.map { |item| item / 4 }
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

    def straight_flush?
      straight? && flush?
    end

    def four_of_a_kind?
      hash = Hash.new(0)
      @cards.each { |item| hash[item] += 1 }
      hash.values.include?(4)
    end

    def full_house?
      three_of_a_kind? && one_pair?
    end

    def flush?
      color = @array.map { |item| item % 4 }
      color.uniq.size == 1
    end

    def normal_straight?
      @cards.each_cons(2) do |previous, current|
        return false unless previous + 1 == current
      end
      true
    end

    def straight?
      [0, 1, 2, 3, 12] == @cards || normal_straight?
    end

    def three_of_a_kind?
      hash = Hash.new(0)
      @cards.each { |item| hash[item] += 1 }
      hash.values.include?(3)
    end

    def two_pair?
      hash = Hash.new(0)
      @cards.each { |item| hash[item] += 1 }
      (hash.values - [2]).size == 1
    end

    def one_pair?
      hash = Hash.new(0)
      @cards.each { |item| hash[item] += 1 }
      hash.values.include?(2)
    end

    def high_card?
      @array.last >= 36
    end
  end
end
