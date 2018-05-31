class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.belongs_to :year, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
