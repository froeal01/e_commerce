class CreateTrip < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :location
    	t.string :cost
    end
  end
end
