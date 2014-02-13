require 'spec_helper'


describe PurchasesController do
	let(:trip) {FactoryGirl.create(:trip)}


  describe "#new" do 
  	it "routes to the correct trip" do 
	  	expect(get: "/purchases/new#{trip.id}").to route_to(
	  		controller: "purchases",
	  		action: "new",
	  		id: "new#{trip.id}")
	  end

	  it "renders the correct template based on city" do 
	  	

	  end

  end


end