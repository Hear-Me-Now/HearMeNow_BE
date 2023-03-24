# frozen_string_literal: true

module Types
  class LeaderboardType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :score, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
