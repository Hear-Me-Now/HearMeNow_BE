require 'rails_helper'

RSpec.describe 'deck mutation', type: :request do
  it 'adds a deck entry to the database' do
    mutation_response = decks_mutation('Animals')
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
      mutation_response = decks_mutation('iNsTrumENTS')
      deck = mutation_response["createDeck"]["deck"]
      new_deck = Deck.last
  
      expect(new_deck.category).to eq("iNsTrumENTS")
      new_deck.sound_cards.each do |sc|
        expect(sc.category).to eq('Instruments')
      end
    end
  end

  describe 'deck sad paths' do
    it 'returns a deck with no cards if category does not exist' do
      mutation_response = decks_mutation('accents')
      deck = mutation_response["createDeck"]["deck"]
      new_deck = Deck.last
  
      expect(new_deck.sound_cards.count).to eq(0)
    end

    it 'returns an error if no category is given' do
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
      errors = response.dig('errors')

      expect(errors.first['message']).to eq("Argument 'category' on InputObject 'CreateDeckInput' is required. Expected type String!")
      expect(Deck.last).to be nil
    end
  end
  private

  def decks_mutation(category)
    response = gql <<-GQL
      mutation createDeck{
        createDeck(input: {
          category: "#{category}"
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