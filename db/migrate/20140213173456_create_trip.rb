class CreateTrip < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :location
    	t.integer :cost
    end
  end
end
