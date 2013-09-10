Feature: Create source annotation
  Scenario: Unsuccessful creation of a source annotation
    Given the user signed in as a professor
    And a user visits the create source annotation page
    When he submits an empty form
    Then he should see a non blank title error
    And he should see a non blank content error
    And he should not see a too long title error
    And he should not see a non blank source_id error

  Scenario: Unsuccessful creation of a source annotation
    Given the user signed in as a professor
    And a user visits the create source annotation page
    When he submits only the title field
    Then he should see a non blank content error
    And he should not see a non blank title error
    And he should not see a too long title error
    And he should not see a non blank source_id error

  Scenario: Unsuccessful creation of a source annotation
    Given the user signed in as a professor
    And a user visits the create source annotation page
    When he submits only the content field
    Then he should see a non blank title error
    And he should not see a non blank content error
    And he should not see a too long title error
    And he should not see a non blank source_id error

  Scenario: Unsuccessful creation of a source annotation
    Given the user signed in as a professor
    And a user visits the create source annotation page
    When he submits the form with a title longer than 100 characters
    Then he should see a too long title error
    And he should not see a non blank content error
    And he should not see a non blank title error
    And he should not see a non blank source_id error

  Scenario: Successful creation of a source annotation
    Given the user signed in as a professor
    And a user visits the create source annotation page
    When he submits the form correctly
    Then he should see a success flash message