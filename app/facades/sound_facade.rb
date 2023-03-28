class SoundFacade
  def self.get_link(id)
    data = SoundService.get_sound_data(id)
    data[:previews][:"preview-hq-mp3"]
  end
end