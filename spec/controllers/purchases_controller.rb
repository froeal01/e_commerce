require 'spec_helper'


describe PurchasesController do
	let(:trip) {FactoryGirl.create(:trip)}


  describe "#new" do 
  	it "routes to the correct trip" do 
	  	expect(get: "/purchases/#{trip.id}").to route_to(
	  		controller: "purchases",
	  		action: "new")
	  end

  end


end