# frozen_string_literal: true

class Deck < ApplicationRecord
  validates_presence_of :category, :difficulty
  has_many :deck_cards, dependent: :destroy
  has_many :sound_cards, through: :deck_cards
  after_create :add_sound_cards

  def return_sound_card
    return if sound_cards.empty?

    SoundCard.find(destroy_deck_card.sound_card_id)
  end

  private

  def destroy_deck_card
    deck_cards.first.destroy
  end

  def add_sound_cards
    initial_sound_cards.each do |sc|
      DeckCard.create(sound_card_id: sc.id, deck_id: id)
    end
  end

  def initial_sound_cards
    SoundCard.where('lower(category) ILIKE ?', "%#{category.downcase}%").where('lower(difficulty) ILIKE ?',
                                                                               "%#{difficulty.downcase}").shuffle.sample(8)
  end
end
