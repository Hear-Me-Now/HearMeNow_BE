# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deck do
  describe 'validations' do
    it { should validate_presence_of :category }
  end

  describe 'associations' do
    it { should have_many :deck_cards }
    it { should have_many(:sound_cards).through(:deck_cards) }
  end

  describe 'get_cards' do
    it 'should create 8 deckcards of the correct category' do
      deck = Deck.create!(category: 'Animals', difficulty: 'easy')

      expect(deck.sound_cards.count).to eq(8)
      deck.sound_cards.each do |sc|
        expect(sc.category).to eq('Animals')
      end
    end

    it 'should create 8 deckcards of the correct category' do
      deck = Deck.create!(category: 'misc', difficulty: 'medium')

      expect(deck.sound_cards.count).to eq(8)
      deck.sound_cards.each do |sc|
        expect(sc.category.include?('Misc')).to eq true
      end
    end
  end

  describe 'return_sound_card' do
    it 'returns a soundcard and deletes the corresponding deck card' do
      deck = Deck.create!(category: 'Instruments', difficulty: 'medium')

      expect(deck.sound_cards.count).to eq(8)

      sound_card = deck.return_sound_card

      expect(sound_card).to be_a SoundCard
      expect(sound_card.category).to eq('Instruments')
      expect(deck.sound_cards.count).to eq(7)

      deck.return_sound_card

      expect(deck.sound_cards.count).to eq(6)

      6.times do
        deck.return_sound_card
      end

      expect(deck.sound_cards.count).to eq(0)
      expect(deck.return_sound_card).to eq(nil)
    end
  end
end
