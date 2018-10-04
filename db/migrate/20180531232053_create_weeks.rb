class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.belongs_to :year, foreign_key: true

      t.string :date
      t.boolean :closed?
      t.integer :misc_charges
      t.string :notes

      t.timestamps null: false
    end
  end
end
