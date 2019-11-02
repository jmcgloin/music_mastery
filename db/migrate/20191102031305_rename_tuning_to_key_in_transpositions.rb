class RenameTuningToKeyInTranspositions < ActiveRecord::Migration[6.0]
  def change
  	rename_column :transpositions, :tuning, :key
  end
end
