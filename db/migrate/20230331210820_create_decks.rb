# frozen_string_literal: true

class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :category
      t.string :difficulty

      t.timestamps
    end
  end
end
