# frozen_string_literal: true

class Leaderboard < ApplicationRecord
  validates_presence_of :name, :score, :difficulty
  validates_numericality_of :score, greater_than_or_equal_to: 0
end
