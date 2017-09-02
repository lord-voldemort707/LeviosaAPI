class Player < ApplicationRecord
  belongs_to :team
  has_many :player_seasons, dependent: :destroy
  has_one :data_source

  validates_presence_of :name, :position
end
