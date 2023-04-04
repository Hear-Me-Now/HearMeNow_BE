require 'rails_helper'

RSpec.describe SoundService do
  describe 'self.get_sound_data' do
    it 'returns a json containing sound information', :vcr do
      id = 658_349
      data = SoundService.get_sound_data(id)

      expect(data[:id]).to eq(id)
      expect(data[:previews][:"preview-hq-mp3"]).to eq('https://cdn.freesound.org/previews/658/658349_12274174-hq.mp3')
    end
  end
end
