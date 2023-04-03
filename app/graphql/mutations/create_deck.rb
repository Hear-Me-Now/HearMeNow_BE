class Mutations::CreateDeck < Mutations::BaseMutation
  argument :category, String, required: true
  
  field :deck, Types::DeckType, null: false
  field :errors, [String], null: false

  def resolve(category:)
    deck = Deck.new(category: category)
    if deck.save && deck.sound_cards.count > 0
      {
        deck: deck,
        errors: []
      }
    elsif deck.save && deck.sound_cards.count < 1
      {
        deck: nil,
        errors: ["There are no sound cards for category #{category}"]
      }
    else
      {
        deck: nil,
        errors: deck.errors.full_messages
      }
    end
  end
end