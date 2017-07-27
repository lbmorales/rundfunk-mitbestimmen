@121
Feature: Click on broadcast title to see details
  As a user
  I would like to see a detailed view when I click on the title of a broadcast
  In order to recap and see the description of that broadcast again

  Background:
    Given I am logged in
    And we have these broadcasts in our database:
      | Title                | Medium | Station   | Created at | Updated at | Description                                                    |
      | Sportschau           | TV     | Das Erste | 2017-07-27 | 2017-08-01 | Fußball-Bundesliga und vieles mehr.                            |
      | Medienmagazin        | Radio  | radioeins | 2017-07-27 | 2017-08-01 | Welche Zukunft hat die ARD? Antworten gibt's im Medienmagazin. |
      | Sendung mit der Maus | TV     | WDR       | 2017-07-27 | 2017-08-01 | Lach und Sachgeschichten mit der Maus und dem Elefanten.       |

  Scenario: Click title to see details
    Given my votes look like this:
      | Title                | Support | Amount |
      | Sportschau           | No      | -      |
      | Medienmagazin        | Yes     | €7.50  |
      | Sendung mit der Maus | Yes     | €10.00 |
    When I look at my broadcasts
    And I ask myself: What was "Medienmagazin" about?
    And I click on "Medienmagazin"
    Then I can see these details:
      | Title           | Medienmagazin                                                  |
      | Medium          | Radio                                                          |
      | Station         | radioeins                                                      |
      | Created at      | 7/27/2017                                                      |
      | Last updated at | 8/1/2017                                                       |
      | Description     | Welche Zukunft hat die ARD? Antworten gibt's im Medienmagazin. |
