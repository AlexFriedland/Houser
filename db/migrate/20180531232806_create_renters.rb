class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.belongs_to :week, foreign_key: true
      t.string :name
      t.string :address
      t.string :notes

      t.timestamps null: false
    end
  end
end
