class SoundCard < ApplicationRecord
  has_many :wrong_answers, dependent: :destroy
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  validates_presence_of :correct_answer, :category

  before_validation :capitalize_answer

  def capitalize_answer
    self.correct_answer = self.correct_answer.titleize if self.correct_answer
  end

end