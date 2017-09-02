class CreatePlayerSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :player_seasons do |t|
      t.string :season
      t.string :team
      t.string :league
      t.integer :games_played
      t.integer :goals
      t.integer :assists
      t.integer :points
      t.integer :pim
      t.integer :shots
      t.decimal :save_percentage
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
