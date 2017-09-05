class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :player_count, :players

  def players
    players = []
    if(@instance_options[:include_players])
      players = object.players
    end
    players.map do | p |
      PlayerSerializer.new(p, @instance_options).serializable_hash
    end
  end

end
