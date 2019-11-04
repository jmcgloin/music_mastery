class CreatePieceTranspositions < ActiveRecord::Migration[6.0]
  def change
    create_table :piece_transpositions do |t|
      t.integer :piece_id
      t.integer :transposition_id

      t.timestamps
    end
  end
end
