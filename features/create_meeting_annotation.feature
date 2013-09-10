Feature: Create meeting annotation
  Scenario: Unsuccessful creation of a meeting annotation
    Given the user signed in as a professor
    And a meeting exists
    And a user visits the create meeting annotation page for that meeting
    When he submits an empty form
    Then he should see a non blank title error
    And he should see a non blank content error
    And he should not see a too long title error

  Scenario: Unsuccessful creation of a meeting annotation
    Given the user signed in as a professor
    And a meeting exists
    And a user visits the create meeting annotation page for that meeting
    When he submits only the title field
    Then he should see a non blank content error
    And he should not see a non blank title error
    And he should not see a too long title error

  Scenario: Unsuccessful creation of a meeting annotation
    Given the user signed in as a professor
    And a meeting exists
    And a user visits the create meeting annotation page for that meeting
    When he submits only the content field
    Then he should see a non blank title error
    And he should not see a non blank content error
    And he should not see a too long title error

  Scenario: Unsuccessful creation of a meeting annotation
    Given the user signed in as a professor
    And a meeting exists
    And a user visits the create meeting annotation page for that meeting
    When he submits the form with a title longer than 100 characters
    Then he should see a too long title error
    And he should not see a non blank content error
    And he should not see a non blank title error

  Scenario: Successful creation of a meeting annotation
    Given the user signed in as a professor
    And a meeting exists
    And a user visits the create meeting annotation page for that meeting
    When he submits the form correctly
    Then he should see a success flash message