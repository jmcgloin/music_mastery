class RemoveTranspositionFromPieces < ActiveRecord::Migration[6.0]
  def change
  	remove_column :pieces, :transposition
  end
end
