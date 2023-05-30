class AddAgeToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :age, :integer
  end
end
