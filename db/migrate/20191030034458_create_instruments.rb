class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.string :instrument_type
      t.string :instrument_category
      t.string :tuning, default:"c"
      t.integer :musician_id

      t.timestamps
    end
  end
end
