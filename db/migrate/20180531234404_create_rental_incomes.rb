class CreateRentalIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_incomes do |t|
      t.belongs_to :week, foreign_key: true
      t.integer :amount
      t.integer :percentPaid

      t.timestamps null: false
    end
  end
end
