# frozen_string_literal: true

class SoundCard < ApplicationRecord
  has_many :wrong_answers, dependent: :destroy
  has_many :deck_cards, dependent: :destroy
  has_many :decks, through: :deck_cards

  validates_presence_of :correct_answer, :category

  before_validation :capitalize_answer

  def capitalize_answer
    self.correct_answer = correct_answer.titleize if correct_answer
  end
end
