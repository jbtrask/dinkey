class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.string :name

      t.timestamps
    end
  end
end
