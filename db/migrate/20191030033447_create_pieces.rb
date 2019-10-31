class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :key_signature
      t.string :time_signature
      t.integer :difficulty
      t.string :tempo
      t.string :transposition

      t.timestamps
    end
  end
end
