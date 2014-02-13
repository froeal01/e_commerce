require 'spec_helper'

describe Trip do 

	describe "assigns correct values" do 

		it "has a valid factory" do 
			expect(FactoryGirl.create(:trip)).to be_valid
		end

		it "can assign a location name" do 
			expect(Trip.create(location: "Paris")).to be_valid
		end

		it "can assign a cost" do 
			expect(Trip.create(cost: "$700")).to be_valid
		end
	end
end