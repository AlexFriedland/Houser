class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.belongs_to :house, foreign_key: true
      t.integer :total_income

      t.timestamps null: false
    end
  end
end
