require 'rails_helper'

RSpec.describe Deck do
  describe 'validations' do
    it { should validate_presence_of :category}
  end
end