class CreateRentalIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_incomes do |t|
      t.belongs_to :week, foreign_key: true
      t.integer :percentPaid
      t.string :payment

      t.timestamps
    end
  end
end
