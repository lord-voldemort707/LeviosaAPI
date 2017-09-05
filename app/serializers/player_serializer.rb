class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :team_id, :player_seasons

  def player_seasons
    player_seasons = []
    if(@instance_options[:latest_season_only])
      player_seasons << object.latest_season
    else
      player_seasons = object.player_seasons.all
    end
    player_seasons
  end
end
