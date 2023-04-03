class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :sound_card
end
