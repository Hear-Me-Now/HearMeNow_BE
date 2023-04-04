# frozen_string_literal: true

class CreateWrongAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :wrong_answers do |t|
      t.references :sound_card, foreign_key: true
      t.string :answer
      t.timestamps
    end
  end
end
