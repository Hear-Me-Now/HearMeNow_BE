# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Leaderboard do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :score }
    it { should validate_numericality_of(:score).is_greater_than_or_equal_to(0) }
  end
end
