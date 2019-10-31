class CreateTranspositions < ActiveRecord::Migration[6.0]
  def change
    create_table :transpositions do |t|
      t.string :instrument
      t.string :tuning

      t.timestamps
    end
  end
end
