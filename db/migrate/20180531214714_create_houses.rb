class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :info
      t.integer :value
      t.integer :purchase_price
      t.integer :market_value
      t.integer :total_income
      t.integer :total_expenses

      t.timestamps null: false
    end
  end
end
