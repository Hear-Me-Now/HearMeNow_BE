class SoundFacade
  def self.get_link(id)
    data = SoundService.get_sound_data(id)
    link = data[:url]
  end
end