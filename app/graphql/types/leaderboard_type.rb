# frozen_string_literal: true

module Types
  class LeaderboardType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :score, Integer, null: false
    field :category, String, null: false
    field :difficulty, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
