# frozen_string_literal: true

module Mutations
  class CreateDeck < Mutations::BaseMutation
    argument :category, String, required: true

    field :deck, Types::DeckType
    field :errors, [String], null: false

    def resolve(category:)
      deck = Deck.new(category: category)
      if deck.save
        if deck.sound_cards.count.positive?
          {
            deck: deck,
            errors: []
          }
        else
          deck.destroy
          {
            deck: nil,
            errors: ["There are no sound cards for category #{category}"]
          }
        end
      else
        {
          deck: nil,
          errors: deck.errors.full_messages
        }
      end
    end
  end
end
