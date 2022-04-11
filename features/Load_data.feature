Feature: Home page
  As a planner
  I need to see the home page of my app
  The home page should read saved events and display them 

	Scenario: View welcome page
  		Given I am on the home page
  		Then I should see "Plannxt"
  		Then I should see the canvas
  		Then I should see the item menu
  		
	Scenario: Show saved data
  		Given I have received the saved data
  		Then I should see event icons on canvas