class RemoveColumnFromAcademics < ActiveRecord::Migration[5.2]
  def change
    remove_column :academics, :total
    remove_column :academics, :percentage
    remove_column :academics, :remarks
  end
end
