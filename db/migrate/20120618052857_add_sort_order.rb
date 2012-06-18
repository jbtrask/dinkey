class AddSortOrder < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :sort_order
    end
    change_table :couples do |t|
      t.integer :sort_order
    end
  end
end
