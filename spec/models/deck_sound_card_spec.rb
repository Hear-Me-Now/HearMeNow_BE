require 'rails_helper'

RSpec.describe DeckCard do
  describe 'associations' do
    it { should belong_to :sound_card }
    it { should belong_to :deck }
  end
end
