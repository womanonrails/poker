require 'pry'

module Poker
  # Poker hand
  class Hand
    def check(array)
      array.sort!
      return 9 if straight_flush?(array)
      return 8 if four_of_a_kind?(array)
      return 7 if full_house?(array)
      return 6 if flush?(array)
      return 5 if straight?(array)
      return 4 if three_of_a_kind?(array)
      return 3 if two_pair?(array)
      return 2 if one_pair?(array)
      return 1 if high_card?(array)
      return 0
    end

    def straight_flush?(array)
      straight?(array) && flush?(array)
    end

    def four_of_a_kind?(array)
      hash = Hash.new(0)
      array.each { |item| hash[item / 4] += 1 }
      hash.values.include?(4)
    end

    def full_house?(array)
      three_of_a_kind?(array) && one_pair?(array)
    end

    def flush?(array)
      color = array.map { |item| item % 4 }
      color.uniq.size == 1
    end

    def normal_straight?(array)
      array.each_cons(2) do |previous, current|
        return false unless previous + 1 == current
      end
      true
    end

    def straight?(array)
      carts = array.map { |item| item / 4 }
      [0, 1, 2, 3, 12] == carts || normal_straight?(carts)
    end

    def three_of_a_kind?(array)
      hash = Hash.new(0)
      array.each { |item| hash[item / 4] += 1 }
      hash.values.include?(3)
    end

    def two_pair?(array)
      hash = Hash.new(0)
      array.each { |item| hash[item / 4] += 1 }
      (hash.values - [2]).size == 1
    end

    def one_pair?(array)
      hash = Hash.new(0)
      array.each { |item| hash[item / 4] += 1 }
      hash.values.include?(2)
    end

    def high_card?(array)
      array.last >= 36
    end
  end
end
