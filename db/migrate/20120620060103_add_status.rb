class AddStatus < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.string :status
    end
    change_table :couples do |t|
      t.string :status
    end
  end
end
