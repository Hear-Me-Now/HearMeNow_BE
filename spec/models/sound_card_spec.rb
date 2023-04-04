# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SoundCard do
  describe 'validations' do
    it { should validate_presence_of :correct_answer }
    it { should validate_presence_of :category }
  end

  describe 'associations' do
    it { should have_many :wrong_answers }
    it { should have_many :deck_cards }
    it { should have_many(:decks).through(:deck_cards) }
  end

  describe '#capitalize_answer' do
    it 'capitalizes the answer of the sound card' do
      sc = SoundCard.create!(correct_answer: 'big bird', category: 'Animals')

      expect(sc.correct_answer).to eq('Big Bird')
    end
  end
end
