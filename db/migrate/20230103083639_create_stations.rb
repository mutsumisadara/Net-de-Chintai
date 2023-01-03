class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.text :line
      t.text :station
      t.integer :on_foot
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
