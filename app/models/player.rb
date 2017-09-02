class Player < ApplicationRecord
  belongs_to :team
  has_many :player_seasons, dependent: :destroy

  validates_presence_of :name, :position
end
