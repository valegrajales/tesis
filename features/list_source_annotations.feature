Feature: List source annotations
  Scenario: List annotations for a source that does not have any
    Given there are no annotations for source with source_id 100
    And the user signed in as a professor
    When he visits the page for listing its annotations
    Then he should see a "No annotations for this source." message

  Scenario: List annotations for a source
    Given there are 10 annotations for source with source_id 101
    And the user signed in as a professor
    When he visits the page for listing its annotations
    Then he should see a list of 10 annotations