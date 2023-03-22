class WrongAnswer < ApplicationRecord
  belongs_to :sound_card

  validates_presence_of :answer
end