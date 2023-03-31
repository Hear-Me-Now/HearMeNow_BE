require 'rails_helper'

RSpec.describe Deck do
  describe 'validations' do
    it { should validate_presence_of :category}
  end

  describe 'associations' do
    it { should have_many :deck_cards }
    it { should have_many(:sound_cards).through(:deck_cards)}
  end

  describe 'get_cards' do
    it 'should create 8 deckcards of the correct category' do
      deck = Deck.create!(category: "Animals")
      expect(deck.sound_cards.count).to eq(8)
      deck.sound_cards.each do |sc|
        expect(sc.category).to eq("Animals")
      end
    end
  end
end