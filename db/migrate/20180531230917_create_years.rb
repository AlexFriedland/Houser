class CreateYears < ActiveRecord::Migration[5.2]
  def change
    create_table :years do |t|
      t.belongs_to :income, foreign_key: true
      t.integer :year

      t.timestamps null: false
    end
  end
end
