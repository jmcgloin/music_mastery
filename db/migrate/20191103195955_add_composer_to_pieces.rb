class AddComposerToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :composer, :string
  end
end
