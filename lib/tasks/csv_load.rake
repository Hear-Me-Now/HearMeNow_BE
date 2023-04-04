# frozen_string_literal: true

require 'csv'

namespace :csv_load do
  task sound_cards: :environment do
    puts 'Loading Sound Card Information!'
    SoundCard.destroy_all
    CSV.foreach('./db/data/sound_cards.csv', headers: true) do |row|
      SoundCard.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('sound_cards')
  end

  task wrong_answers: :environment do
    puts 'Loading Wrong Answer Information!'
    WrongAnswer.destroy_all
    CSV.foreach('./db/data/wrong_answers.csv', headers: true) do |row|
      WrongAnswer.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('wrong_answers')
  end

  task :all do
    Rake::Task['csv_load:sound_cards'].invoke
    Rake::Task['csv_load:wrong_answers'].invoke
  end
end
