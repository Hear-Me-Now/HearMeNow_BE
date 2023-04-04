class Mutations::CreateLeaderboard < Mutations::BaseMutation
  argument :name, String, required: true
  argument :score, Integer, required: true
  argument :category, String, required: true
  argument :difficulty, String, required: true

  field :leaderboard, Types::LeaderboardType, null: false
  field :errors, [String], null: false

  def resolve(name:, score:, category:, difficulty:)
    leaderboard = Leaderboard.new(name: name, score: score, category: category, difficulty: difficulty)
    if leaderboard.save
      {
        leaderboard: leaderboard,
        errors: []
      }
    else
      {
        leaderboard: nil,
        errors: leaderboard.errors.full_messages
      }
    end
  end
end
