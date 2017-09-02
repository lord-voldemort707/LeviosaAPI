require 'faker'

namespace :db do
  desc "Fill test db with dummy data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    positions = ["C", "RW", "LW", "LD", "RD"]
    leagues = ["WHL", "OHL", "QMJHL", "USHL", "HE"]

    team = Team.create!({
      name: "Winnipeg Jets",
      code: "WPG"
    })

    10.times do | n |
      name = Faker::Name.name
      position = positions.sample
      player = Player.create!(name: name, position: position, team_id: team.id)

      goals = Faker::Number.between(0, 60)
      assists = Faker::Number.between(0, 120)
      player_season = {
        season: "2016-2017",
        games_played: Faker::Number.between(25, 75),
        goals: goals,
        assists: assists,
        points: goals + assists,
        pim: Faker::Number.between(0, 200),
        shots: Faker::Number.between(goals / 0.30, goals / 0.025),
        team: Faker::Team.name,
        league: leagues.sample,
        player_id: player.id
      }
      PlayerSeason.create!(player_season)
    end
  end
end
