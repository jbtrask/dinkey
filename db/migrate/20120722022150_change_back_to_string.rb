class ChangeBackToString < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.change :status, :string, limit: 1000
    end
    change_table :couples do |t|
      t.change :status, :string, limit: 1000
    end
  end
end
