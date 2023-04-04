# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SheetFacade do
  describe 'getting sheets' do
    it 'returns cell information for sound card sheet', :vcr do
      sound_card_data = SheetFacade.get_sheet('Sound%20Cards')

      expect(sound_card_data.first.second).to eq('4202')
      expect(sound_card_data[44].second).to eq('256568')
      expect(sound_card_data.first.first).to eq('Misc')
      expect(sound_card_data[34].first).to eq('Machines')
      expect(sound_card_data.first.third).to eq('Boiling Water')
      expect(sound_card_data[46].third).to eq('Howler Monkey')
    end

    it 'returns cell information for wrong answer sheet', :vcr do
      wrong_answer_data = SheetFacade.get_sheet('Wrong%20Answers')

      expect(wrong_answer_data.first.first).to eq('4202')
      expect(wrong_answer_data[44].second).to eq('Timpani')
      expect(wrong_answer_data.first.second).to eq('Hot Tub Jets')
      expect(wrong_answer_data[34].first).to eq('58811')
    end
  end
end
