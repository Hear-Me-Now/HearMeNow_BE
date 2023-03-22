require 'rails_helper'

RSpec.describe WrongAnswer do
  describe 'validations' do
    it { should validate_presence_of :answer}
  end

  describe 'associations' do
    it { should belong_to :sound_card}
  end
end

