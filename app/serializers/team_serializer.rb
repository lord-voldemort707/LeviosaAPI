class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :player_count
end
