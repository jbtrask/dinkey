class AddCoupleColumns < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.references :couple
      t.integer :couple_sort_order
    end
  end
end
