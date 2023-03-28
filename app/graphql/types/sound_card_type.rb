# frozen_string_literal: true

module Types
  class SoundCardType < Types::BaseObject
    field :id, ID, null: false
    field :correct_answer, String, null: false
    field :category, String, null: false
    field :link, String, null: false
    # field :wrong_answers, Array, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false


    # Need to figure out how to limit responses before turning on the link method
    # def link
    #   SoundFacade.get_link(object.id)
    # end
  

    # def wrong_answers
    #   require 'pry'; binding.pry
    #   object.wrong_answers
    # end
  end
end
