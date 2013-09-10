Feature: Source annotation session
  Scenario: Not signed in
    Given the user is not signed in
    And is working on a thesis with id 1
    And is working on a source with id 1
    When he visits the page for listing all annotations
    Then he should see session error message
    When he visits the page for creating a new annotation
    Then he should see session error message
    When he visits the page for the annotation with id 1
    Then he should see session error message

  Scenario: Signed in as a student
    Given the user signed in as a student
    And is working on a thesis with id 1
    And is working on a source with id 1
    When he visits the page for listing all annotations
    Then he should not see the session error message
    When he visits the page for creating a new annotation
    Then he should not see the session error message
    When he visits the page for the annotation with id 1
    Then he should not see the session error message

  Scenario: Signed in as a professor
    Given the user signed in as a professor
    And is working on a thesis with id 1
    And is working on a source with id 1
    When he visits the page for listing all annotations
    Then he should not see the session error message
    When he visits the page for creating a new annotation
    Then he should not see the session error message
    When he visits the page for the annotation with id 1
    Then he should not see the session error message