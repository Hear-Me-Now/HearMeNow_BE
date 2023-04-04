namespace :sheets_load do
  task sound_cards: :environment do
    puts 'Loading Sound Card Information!'
    SoundCard.destroy_all
    sound_card_data = SheetFacade.get_sheets('Sound%20Cards')
    sound_card_data.each do |sc|
      SoundCard.create!({ category: sc[0], id: sc[1], correct_answer: sc[2] })
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('sound_cards')
  end

  task wrong_answers: :environment do
    puts 'Loading Wrong Answer Information!'
    WrongAnswer.destroy_all
    wrong_answer_data = SheetFacade.get_sheets('Wrong%20Answers')
    wrong_answer_data.each do |wa|
      WrongAnswer.create!({ sound_card_id: wa[0], answer: wa[1] })
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('wrong_answers')
  end

  task :all do
    Rake::Task['sheets_load:sound_cards'].invoke
    Rake::Task['sheets_load:wrong_answers'].invoke
  end
end
