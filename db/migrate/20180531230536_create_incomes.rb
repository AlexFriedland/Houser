class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.belongs_to :house, foreign_key: true

      t.timestamps
    end
  end
end
