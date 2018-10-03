class CreateRincomes < ActiveRecord::Migration[5.2]
  def change
    create_table :rincomes do |t|
      t.belongs_to :week, foreign_key: true
      t.belongs_to :payment, foreign_key: true

      t.integer :amount
      t.integer :percentPaid

      t.timestamps null: false
    end
  end
end
