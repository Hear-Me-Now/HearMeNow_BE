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