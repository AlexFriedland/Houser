class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.belongs_to :rentalIncome, foreign_key: true
      t.string :date
      t.integer :amount
      t.string :type
      t.string :notes

      t.timestamps null: false
    end
  end
end
