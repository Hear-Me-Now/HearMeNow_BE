# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sound Facade' do
  describe 'link return' do
    it 'returns a link if given an ID', :vcr do
      expect(SoundFacade.get_link(658_349)).to eq('https://cdn.freesound.org/previews/658/658349_12274174-hq.mp3')
    end
  end
end
