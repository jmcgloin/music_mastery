class RemoveDefaultFromTuningOnInstruments < ActiveRecord::Migration[6.0]
  def change
  	change_column_default :instruments, :tuning, nil
  end
end
