class SoundCard < ApplicationRecord
  has_many :wrong_answers, dependent: :destroy

  validates_presence_of :correct_answer, :category

  before_validation :capitalize_answer

  def capitalize_answer
    self.correct_answer = self.correct_answer.titleize if self.correct_answer
  end
end