# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sound Card Requests', type: :request do
  describe 'Sound Card Queries' do
    before :each do
      allow(SoundFacade).to receive(:get_link).and_return('https://cdn.freesound.org/previews/510/510917_11157357-hq.mp3')
    end

    it 'returns asound card in the correct category for the given deck id', :vcr do
      deck_id = Deck.create!(category: 'Animals', difficulty: 'easy').id
      response = query_sound_cards_by_deck_id(deck_id)
      sound_card = response.dig('data', 'soundCard')

      expect(sound_card['category']).to eq('Animals')
      expect(SoundCard.exists?(sound_card['correctAnswer']))
      expect(SoundCard.exists?(sound_card['id']))
      expect(SoundCard.find(sound_card['id']).wrong_answers.pluck(:answer).sort).to eq(sound_card['wrongAnswers'].sort)
    end

    describe 'Sound Card Sad Paths' do
      it 'returns an error if deck is out of cards', :vcr do
        deck_id = Deck.create!(category: 'Animals', difficulty: 'Easy').id
        8.times do
          query_sound_cards_by_deck_id(deck_id)
        end
        response = query_sound_cards_by_deck_id(deck_id)
        errors = response['errors']

        expect(errors.count).to eq(1)
        expect(errors.first['message']).to eq('Cannot return null for non-nullable field Query.soundCard')
      end

      it 'returns an error if given deck id does not exist', :vcr do
        Deck.create!(category: 'Misc', difficulty: 'Easy')
        deck_id = Deck.maximum(:id) + 1

        response = query_sound_cards_by_deck_id(deck_id)
        errors = response['errors']
        expect(errors.first['message']).to eq('SoundCard not found')
      end

      it 'returns an error if no deck id is given', :vcr do
        response = query_sound_cards_with_no_deck
        errors = response['errors']
        expect(errors.first['message']).to eq("Field 'soundCard' is missing required arguments: deckId")
      end
    end
  end

  describe 'Sound card edge cases' do
    it 'returns a unique error if api limit is reached' do
      allow(SoundService).to receive(:get_sound_data).and_return({})
      deck_id = Deck.create!(category: 'Misc', difficulty: 'easy').id

      response = query_sound_cards_by_deck_id(deck_id)
      errors = response['errors']
      expect(errors.first['message']).to eq('Unable to retrieve link, API limit reached')
    end
  end

  private

  def query_sound_cards_by_deck_id(deck_id)
    gql <<-GQL
      query soundCardsByDeckIdQuerySpec {
        soundCard(deckId: "#{deck_id}") {
          id
          category
          correctAnswer
          link
          wrongAnswers
        }
      }
    GQL
  end

  def query_sound_cards_with_no_deck
    gql <<-GQL
      query soundCardsByDeckIdQuerySpec {
        soundCard {
          id
          category
          correctAnswer
          link
          wrongAnswers
        }
      }
    GQL
  end
end
