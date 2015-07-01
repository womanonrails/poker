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
      return 3 if two_pair?(array)
      return 2 if one_pair?(array)
      return 4 if three_of_a_kind?(array)
      return 5 if straight?(array)
      return 1 if high_card?(array)
      return 0
    end

    #Jeśli układ jest pokerem, numery kart modulo 4 są sobie równe
    def straight_flush?(array)
      straight?(array) && flush?(array)
    end

    #jeśli mamy karetę, jeśli podzielę numery kart przez 4
    #4 pierwsze lub 4 ostatnie powinny być sobie równe
    def four_of_a_kind?(array)
      tmp = array.clone
      tmp.collect!{|x| x / 4 }

      helper_array = [0] * 13

      tmp.each do |elem|
        helper_array[elem] += 1
      end

      helper_array.delete(0)

      helper_array.include?(4) && helper_array.include?(1)
    end

    def full_house?(array)
      three_of_a_kind?(array) && one_pair?(array)
    end

    def flush?(array)
      color = array.map { |item| item % 4 }
      color.uniq.size == 1
    end

    def straight?(array)
      if array.last / 4 == 12
        return straight_with_ace?(array)
      else
        return true_straight?(array)
      end
    end

    def straight_with_ace?(array)
      if true_straight?(array)
        return true
      else
        tmp = array.clone
        tmp.collect!{|x| x / 4}
        tmp.delete(12)

        sum = 0;
        tmp.each do |num|
          sum += num
        end

        sum == 6
      end
    end

    def true_straight?(array)
      tmp = array.clone
      minimum_card = tmp[0] / 4

      tmp.collect!{|x| x / 4 - minimum_card}

      sum = 0;
      tmp.each do |num|
        sum += num
      end

      sum == 10
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
