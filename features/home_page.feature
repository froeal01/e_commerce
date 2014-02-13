Feature: Viewing Prices
		In order to see what the price to travel to a city is
		A visitor
		Should be able to view them on my homepage

		Scenario: Shows available cities
				Given I am on the home page
				When I hover over a cities div
				Then I should see the current price
				

