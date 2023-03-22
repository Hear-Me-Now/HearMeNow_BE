class SoundCard < ApplicationRecord
  has_many :wrong_answers, dependent: :destroy

  validates_presence_of :correct_answer, :category
end