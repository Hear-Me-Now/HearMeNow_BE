require 'rails_helper'

RSpec.describe SoundService do
  describe 'self.get_sound_data' do
    it 'returns a json containing sound information', :vcr do
      data = SoundService.get_sound_data(658349)
      binding.pry
    end
  end
end