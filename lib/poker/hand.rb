# frozen_string_literal: true

require 'pry'

# Poker class
module Poker
  ORDER_CHECKING = [
    :royal_flush, :straight_flush, :four_of_a_kind, :full_house, :flush,
    :straight, :three_of_a_kind, :two_pair, :one_pair, :high_card, :none
  ].freeze

  # Poker hand
  class Hand
    def initialize(
      array,
      order_checking = ORDER_CHECKING,
      normalization = CardsNormalization
    )
      @array = array.sort
      @order_checking = order_checking
      @normalization = normalization
    end

    def check
      @order_checking.each do |name|
        return name if class_name(name).check == name
      end
    end

    private

    def class_name(name)
      class_name = 'Poker::' + name.to_s.split('_').collect(&:capitalize).join
      Object.const_get(class_name).new(@array, @normalization)
    end
  end
end
