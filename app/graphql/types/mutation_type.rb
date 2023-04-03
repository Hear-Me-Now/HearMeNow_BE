module Types
  class MutationType < Types::BaseObject
    field :create_leaderboard, mutation: Mutations::CreateLeaderboard
    field :create_deck, mutation: Mutations::CreateDeck
  end
end
