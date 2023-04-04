class SoundFacade
  def self.get_link(id)
    data = SoundService.get_sound_data(id)
    raise LimitReachedError unless data[:previews]

    data[:previews][:"preview-hq-mp3"]
  end
end
