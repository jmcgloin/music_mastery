class AddAddedByToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :added_by, :integer
  end
end
