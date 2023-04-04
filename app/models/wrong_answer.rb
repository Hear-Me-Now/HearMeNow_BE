class WrongAnswer < ApplicationRecord
  belongs_to :sound_card

  validates_presence_of :answer

  before_validation :capitalize_answer

  def capitalize_answer
    self.answer = answer.titleize if answer
  end
end
