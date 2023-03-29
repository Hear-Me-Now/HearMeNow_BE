module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :leaderboards, [Types::LeaderboardType], null: false
    field :sound_cards_by_category, [Types::SoundCardType], null: false do
      argument :category, String, required: true
      argument :limit, Integer, required: true
    end
    field :wrong_answers, [Types::WrongAnswerType], null: false

    def leaderboards
      Leaderboard.order(score: :desc)
    end

    def sound_cards_by_category(category:, limit:)
      limit = 24 if limit > 24
      unless category.downcase.include?('misc')
        SoundCard.where("lower(category) = ?", category.downcase).shuffle.shuffle.first(limit)
      else
        SoundCard.all.shuffle.shuffle.first(limit)
      end
    end

    def wrong_answers
      WrongAnswer.all
    end
  
  end
end
