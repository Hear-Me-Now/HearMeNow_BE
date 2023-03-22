class CreateSoundCards < ActiveRecord::Migration[5.2]
  def change
    create_table :sound_cards do |t|
      t.string :correct_answer
      t.string :category
      t.timestamps
    end
  end
end
