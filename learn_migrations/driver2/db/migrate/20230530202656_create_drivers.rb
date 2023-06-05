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

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
    end
  end
end
