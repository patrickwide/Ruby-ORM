class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.belongs_to :driver
      t.string :numberplate
      t.string :color
      t.string :model
      t.integer :no_of_seats
      t.timestamps
    end
  end
end