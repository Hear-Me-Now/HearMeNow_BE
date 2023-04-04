# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SheetService do
  describe 'getting sheet data' do
    it 'returns the raw sheet data for sound cards', :vcr do
      raw_sheet_data = SheetService.get_sheet('Sound%20Cards')

      expect(raw_sheet_data[:range].include?('Sound Cards')).to eq true
      expect(raw_sheet_data).to have_key(:majorDimension)
      expect(raw_sheet_data).to have_key(:values)
      expect(raw_sheet_data[:values]).to be_a Array
      raw_sheet_data[:values].each do |value|
        expect(value).to be_a Array
        expect(value.count).to eq(3)
      end
    end

    it 'returns the raw sheet data for wrong answers', :vcr do
      raw_sheet_data = SheetService.get_sheet('Wrong%20Answers')

      expect(raw_sheet_data[:range].include?('Wrong Answers')).to eq true
      expect(raw_sheet_data).to have_key(:majorDimension)
      expect(raw_sheet_data).to have_key(:values)
      expect(raw_sheet_data[:values]).to be_a Array
      raw_sheet_data[:values].each do |value|
        expect(value).to be_a Array
        expect(value.count).to eq(2)
      end
    end
  end
end
