# frozen_string_literal: true

module Types
  class WrongAnswerType < Types::BaseObject
    field :id, ID, null: false
    field :sound_card_id, Integer, null: false
    field :answer, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
