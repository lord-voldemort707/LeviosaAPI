class Player < ApplicationRecord
  belongs_to :team
  has_many :player_seasons, dependent: :destroy
  has_one :data_source

  validates_presence_of :name, :position

  def latest_season
    self.player_seasons.find_by_season(Api::Application.config.latest_season)
  end
end
