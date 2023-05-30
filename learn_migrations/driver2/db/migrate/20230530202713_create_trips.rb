class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.belongs_to :customer
      t.belongs_to :car
      t.string :destination
      t.string :pick_up_location
      t.decimal :price
      t.integer :total_passengers
      t.timestamps
    end
  end
end