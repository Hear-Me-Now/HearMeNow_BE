# frozen_string_literal: true

class SoundService
  def self.conn
    url = 'https://freesound.org'
    response = Faraday.new(url: url) do |f|
      f.params['token'] = ENV['FREE_SOUND_KEY']
    end
  end

  def self.get_sound_data(id)
    response = conn.get("/apiv2/sounds/#{id}/")
    JSON.parse(response.body, symbolize_names: true)
  end
end
