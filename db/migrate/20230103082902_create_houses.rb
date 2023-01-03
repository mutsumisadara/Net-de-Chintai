class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :price
      t.text :address
      t.integer :age
      t.text :information

      t.timestamps
    end
  end
end
