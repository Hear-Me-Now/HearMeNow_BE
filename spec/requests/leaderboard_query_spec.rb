require 'rails_helper'

RSpec.describe 'Leaderboard query', type: :request do
  it 'returns requested data' do
    3.times do
      Leaderboard.create({ name: Faker::FunnyName.name, score: Faker::Number.number(digits: 3),
                           category: %w[Animals Instruments Machines Misc].shuffle.sample, difficulty: %w[Easy Medium Hard].shuffle.sample })
    end
    leaderboards = Leaderboard.order(score: :desc)
    leaderboards_response = query_leaderboards
    leaderboards_response.each_with_index do |leaderboard_response, i|
      expect(leaderboard_response['score']).to eq(leaderboards[i].score)
      expect(leaderboard_response['category']).to eq(leaderboards[i].category)
      expect(leaderboard_response['name']).to eq(leaderboards[i].name)
      expect(leaderboard_response['difficulty']).to eq(leaderboards[i].difficulty)
    end
  end

  private

  def query_leaderboards
    response = gql <<-GQL
      query LeaderboardQuerySpec {
        leaderboards {
          score
          category
          difficulty
          name
        }
      }
    GQL

    response.dig('data', 'leaderboards')
  end
end
