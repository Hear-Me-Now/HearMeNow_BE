# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deck mutation', type: :request do
  it 'adds a deck entry to the database' do
    mutation_response = decks_mutation('Animals', 'easy')
    deck = mutation_response['createDeck']['deck']
    errors = mutation_response['createDeck']['errors']
    new_deck = Deck.last

    expect(new_deck.category).to eq('Animals')
    expect(new_deck.difficulty).to eq('easy')
    expect(deck['id']).to eq(new_deck.id.to_s)
    expect(errors).to eq([])
    expect(new_deck.sound_cards.count).to eq(8)
  end

  describe 'deck edge cases' do
    it 'returns a deck with correct categories case insensitively' do
      mutation_response = decks_mutation('iNsTrumENTS', 'easy')
      new_deck = Deck.last

      expect(new_deck.category).to eq('iNsTrumENTS')
      new_deck.sound_cards.each do |sc|
        expect(sc.category).to eq('Instruments')
        expect(sc.difficulty).to eq('easy')
      end
    end
  end

  describe 'deck sad paths' do
    it 'returns a deck with no cards if category does not exist' do
      errors = decks_mutation('accents', 'hard').dig('createDeck', 'errors')

      expect(errors.first).to eq('There are no sound cards for category accents with difficulty hard')
      expect(Deck.last).to be nil
    end

    it 'returns an error if no category is given' do
      response = gql <<-GQL
        mutation createDeck{
          createDeck(input: {
            difficulty: "easy"
          }) {
            deck {
              id
            }
            errors
          }
        }
      GQL
      errors = response['errors']

      expect(errors.count).to eq(1)
      expect(errors.first['message']).to eq("Argument 'category' on InputObject 'CreateDeckInput' is required. Expected type String!")
      expect(Deck.last).to be nil
    end

    it 'returns an error if no difficulty is given' do
      response = gql <<-GQL
        mutation createDeck{
          createDeck(input: {
            category: "Animals"
          }) {
            deck {
              id
            }
            errors
          }
        }
      GQL
      errors = response['errors']
        
      expect(errors.count).to eq(1)
      expect(errors.first['message']).to eq("Argument 'difficulty' on InputObject 'CreateDeckInput' is required. Expected type String!")
      expect(Deck.last).to be nil
    end

    it 'returns an error if no difficulty and no category is given' do
      response = gql <<-GQL
        mutation createDeck{
          createDeck(input: {
          }) {
            deck {
              id
            }
            errors
          }
        }
      GQL
      errors = response['errors']

      expect(errors.count).to eq(2)
      expect(errors.first['message']).to eq("Argument 'category' on InputObject 'CreateDeckInput' is required. Expected type String!")
      expect(errors.second['message']).to eq("Argument 'difficulty' on InputObject 'CreateDeckInput' is required. Expected type String!")
      expect(Deck.last).to be nil
    end
  end

  private

  def decks_mutation(category, difficulty)
    response = gql <<-GQL
      mutation createDeck{
        createDeck(input: {
          category: "#{category}",
          difficulty: "#{difficulty}"
        }) {
          deck {
            id
          }
          errors
        }
      }
    GQL

    response['data']
  end
end
