class CreateHousesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :houses_tables do |t|
      t.string :address, null: false
      t.timestamps
    end
  end
end
