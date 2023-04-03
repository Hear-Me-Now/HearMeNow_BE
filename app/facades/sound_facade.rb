class SoundFacade
  def self.get_link(id)
    data = SoundService.get_sound_data(id)
    if data[:previews]
      data[:previews][:"preview-hq-mp3"]
    else
      raise LimitReachedError
    end
  end
end