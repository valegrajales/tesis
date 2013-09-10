Feature: List products
  Scenario: List products
    Given there are no products for thesis with thesis_id 200
    And the user signed in as a professor
    When he visits the page for listing its products
    Then he should see a "No products for this thesis." message

  Scenario: List all products
    Given there are 10 products for thesis with thesis_id 201
    And the user signed in as a professor
    When he visits the page for listing its products
    Then he should see a list of 10 products