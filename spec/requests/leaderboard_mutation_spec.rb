require 'rails_helper'

RSpec.describe 'leaderboard mutation', type: :request do
  it 'adds a leaderboard entry to the database' do
    mutation_response = leaderboards_mutation
    leaderboard = mutation_response['createLeaderboard']['leaderboard']
    errors = mutation_response['createLeaderboard']['errors']
    new_leaderboard = Leaderboard.last

    expect(leaderboard['name']).to eq(new_leaderboard.name)
    expect(leaderboard['score']).to eq(new_leaderboard.score)
    expect(leaderboard['difficulty']).to eq(new_leaderboard.difficulty)
    expect(leaderboard['category']).to eq(new_leaderboard.category)
    expect(errors).to eq([])
  end

  private

  def leaderboards_mutation
    response = gql <<-GQL
      mutation createLeaderBoard{
        createLeaderboard(input: {
          name: "Bojack",
          score: 100,
          category: "Animals",
          difficulty: "Hard"
        }) {
          leaderboard {
            name
            score
            difficulty
            category
          }
          errors
        }
      }
    GQL

    response.dig('data')
  end
end
