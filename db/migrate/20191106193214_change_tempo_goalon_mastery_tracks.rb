class ChangeTempoGoalonMasteryTracks < ActiveRecord::Migration[6.0]
  def change
  	change_column :mastery_tracks, :tempo_goal, :string
  end
end
