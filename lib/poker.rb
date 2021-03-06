# frozen_string_literal: true

require 'normalization'
require 'cards_normalization'
require 'rules/frequency_rule'
require 'rules/multi_frequency_rule'
require 'rules/straightness_rule'
require 'rules/flushness_rule'
require 'rules/royalness_rule'
require 'rules/higher_then_rule'
require 'rules_factory'
require 'poker/hand'
require 'poker/straight'
require 'poker/flush'
require 'poker/straight_flush'
require 'poker/royal_flush'
require 'poker/full_house'
require 'poker/four_of_a_kind'
require 'poker/three_of_a_kind'
require 'poker/one_pair'
require 'poker/two_pair'
require 'poker/high_card'
require 'poker/none'
require 'poker/version'

# Poker engine
module Poker
end
