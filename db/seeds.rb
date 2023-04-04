require 'faker'

15.times do
  Leaderboard.create({ name: Faker::FunnyName.name, score: Faker::Number.number(digits: 3),
                       category: %w[Animals Instruments Machines Misc].shuffle.sample, difficulty: %w[Easy Medium Hard].shuffle.sample })
end
