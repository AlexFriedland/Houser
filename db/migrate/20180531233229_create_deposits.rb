class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.belongs_to :week, foreign_key: true
      t.boolean :returned
      t.integer :amount
      t.string :notes

      t.timestamps null: false
    end
  end
end
