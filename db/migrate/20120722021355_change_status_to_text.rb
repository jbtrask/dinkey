class ChangeStatusToText < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.change :status, :text
    end
    change_table :couples do |t|
      t.change :status, :text
    end
  end
end
