class Deck < ApplicationRecord
  validates_presence_of :category
  after_create :get_cards

  private
  
  def get_cards
    sound_cards.each do |sc|
      DeckCard.create(sound_card_id: sc.id, deck_id: self.id)
    end
  end

  def sound_cards
    unless category.downcase.include?('misc')
      SoundCard.where("lower(category) = ?", category.downcase).shuffle.shuffle.first(8)
    else
      SoundCard.all.shuffle.shuffle.first(8)
    end
  end
end
