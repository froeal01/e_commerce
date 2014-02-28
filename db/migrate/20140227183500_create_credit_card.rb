class CreateCreditCard < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
    	t.string :stripe_card_id
    	t.belongs_to :user
    end
  end
end
