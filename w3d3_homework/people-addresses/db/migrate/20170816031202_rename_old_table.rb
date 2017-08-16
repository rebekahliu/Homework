class RenameOldTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :houses_tables, :houses
    rename_table :people_tables, :people
  end
end
