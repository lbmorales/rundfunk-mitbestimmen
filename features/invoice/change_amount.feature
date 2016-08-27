@18
Feature: Change amount
  As a contributor
  I want to click on my invoice table and edit the amount
  To say precisely how much money I want to give to certain broadcasts

  Background:
    Given I am logged in

  Scenario: Click on the amount to change it
    Given my invoice looks like this:
      | Title            | Amount |
      | Tagesthemen      | €3.5   |
      | Morgenmagazin    | €3.5   |
      | Sportschau       | €3.5   |
      | Tagesschau       | €3.5   |
      | Blickpunkt Sport | €3.5   |
    When I look at my invoice and I feel that "Tagesschau" is more important to me
    And I click on "€3.5" where it says "Tagesschau" and enter "5.0"
    Then my updated invoice looks like this:
      | Title            | Amount |
      | Tagesschau       | €5.0   |
      | Tagesthemen      | €3.12  |
      | Morgenmagazin    | €3.12  |
      | Tagesschau       | €3.12  |
      | Blickpunkt Sport | €3.12  |

