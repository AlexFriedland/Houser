class CreateWeekRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :week_renters do |t|
      t.belongs_to :week, index: true
      t.belongs_to :renter, index: true
      
    end
  end
end
