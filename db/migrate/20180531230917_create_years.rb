class CreateYears < ActiveRecord::Migration[5.2]
  def change
    create_table :years do |t|
      t.belongs_to :house, foreign_key: true
      t.integer :year
      t.integer :total_income

      t.timestamps null: false
    end
  end
end
