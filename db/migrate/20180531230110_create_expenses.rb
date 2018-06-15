class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :type
      t.belongs_to :house, foreign_key: true
      t.integer :amount
      t.string :notes
      t.date :date

      t.timestamps null: false
    end
  end
end
