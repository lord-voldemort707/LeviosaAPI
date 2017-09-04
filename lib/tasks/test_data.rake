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

      league = leagues.sample
      team_name = Faker::Team.name
      PlayerSeason.create!(random_season(player.id, team_name, league, "2015-2016"))
      PlayerSeason.create!(random_season(player.id, team_name, league, "2016-2017"))
      DataSource.create!(name: "EP",
                         player_lookup: Faker::Number.between(1001, 20000),
                         player_id: player.id)
    end
  end

  def random_season(player_id, team, league, season)
    goals = Faker::Number.between(0, 60)
    assists = Faker::Number.between(0, 120)
    {
      season: season,
      games_played: Faker::Number.between(25, 75),
      goals: goals,
      assists: assists,
      points: goals + assists,
      pim: Faker::Number.between(0, 200),
      shots: Faker::Number.between(goals / 0.30, goals / 0.025),
      team: team,
      league: league,
      player_id: player_id
    }
  end

end
