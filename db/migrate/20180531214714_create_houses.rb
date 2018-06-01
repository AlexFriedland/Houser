class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :info
      t.integer :value
      t.integer :purchase_price
      t.integer :market_value

      t.timestamps null: false
    end
  end
end
