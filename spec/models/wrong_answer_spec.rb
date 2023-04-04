require 'rails_helper'

RSpec.describe WrongAnswer do
  describe 'validations' do
    it { should validate_presence_of :answer }
  end

  describe 'associations' do
    it { should belong_to :sound_card }
  end

  describe '#capitalize_answer' do
    it 'capitalizes the answer of the sound card' do
      sc = SoundCard.create!(correct_answer: 'Bird', category: 'Animals')
      wa = sc.wrong_answers.create!(answer: 'the dog')

      expect(wa.answer).to eq('The Dog')
    end
  end
end
