class CreateDataSources < ActiveRecord::Migration[5.1]
  def change
    create_table :data_sources do |t|
      t.string :name
      t.string :player_lookup
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
