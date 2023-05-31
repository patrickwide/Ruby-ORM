class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.string :phone_no
      t.string :license
      t.string :status
      t.timestamps
    end
  end
end