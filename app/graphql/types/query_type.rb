# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :leaderboards, [Types::LeaderboardType], null: false
    field :sound_card, Types::SoundCardType, null: false do
      argument :deck_id, ID, required: true
    end
    field :wrong_answers, [Types::WrongAnswerType], null: false

    def leaderboards
      Leaderboard.order(score: :desc)
    end

    def wrong_answers
      WrongAnswer.all
    end

    def sound_card(deck_id:)
      Deck.find(deck_id).return_sound_card
    end
  end
end
