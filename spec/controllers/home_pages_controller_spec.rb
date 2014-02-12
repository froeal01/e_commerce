require 'spec_helper'

describe HomePagesController do

	describe "#index" do 
		it "routes to the root of the website" do 
		 {get: "/"}.should route_to(
		 	controller: "home_pages",
		 	action: "index"
		 	)
		end
		
		it "should render the correct template" do 
			get :index 
			expect(response).to render_template('index')
		end


	end













end