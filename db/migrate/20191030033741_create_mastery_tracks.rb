class CreateMasteryTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :mastery_tracks do |t|
      t.integer :tempo_level
      t.integer :tempo_goal
      t.integer :instrument_id
      t.integer :piece_id

      t.timestamps
    end
  end
end
