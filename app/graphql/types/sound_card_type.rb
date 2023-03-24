# frozen_string_literal: true

module Types
  class SoundCardType < Types::BaseObject
    field :id, ID, null: false
    field :correct_answer, String
    field :category, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
