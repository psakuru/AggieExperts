Feature: Homepage should be accessible
As a user,
So that I can search and login,
I want to arrive on the AggieExperts homepage

Scenario: content on homepage
  Given I am on the home page
  Then I should see "Home"
  And I should see "Contact Us"
  
Scenario: search field and button
  Given I am on the home page
  When I fill in "#search" with "test" 
  And I should see "test"
