require 'rails_helper'

RSpec.describe 'deck mutation', type: :request do
  it 'adds a deck entry to the database' do
    mutation_response = decks_mutation
    deck = mutation_response["createDeck"]["deck"]
    errors = mutation_response["createDeck"]["errors"]
    new_deck = Deck.last

    expect(new_deck.category).to eq("Animals")
    expect(deck["id"]).to eq(new_deck.id.to_s)
    expect(errors).to eq([])
    expect(new_deck.sound_cards.count).to eq(8)
  end

  describe 'deck edge cases' do
    it 'returns a deck with correct categories case insensitively' do
      # TODO: write test
    end
  end

  describe 'deck sad paths' do
    it 'returns an error if category does not exist' do
      # TODO: Write test
    end

    it 'returns an error if no category is given' do
      # TODO: Write test
    end
  end
  private

  def decks_mutation()
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

    response.dig('data')
  end
end