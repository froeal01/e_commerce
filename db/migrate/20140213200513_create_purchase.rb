class CreatePurchase < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
    	t.string :email
    	t.belongs_to :trip
    end
  end
end
