module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :leaderboards, [Types:LeaderboardType], null: false
    field :sound_cards, [Types:SoundCardType], null: false
    field :wrong_answers, [Types:WrongAnswerType], null: false

    def leaderboards
      Leaderboard.all
    end

    def sound_cards
      SoundCard.all
    end

    def wrong_answers
      WrongAnswer.all
    end
  
  end
end
