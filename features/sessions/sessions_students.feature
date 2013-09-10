Feature: Students session
  Scenario: Not signed in
    Given the user is not signed in
    When he visits the page for listing all students
    Then he should see session error message
    When he visits the page for creating a new student
    Then he should see session error message
    When he visits the page for the student with id 1
    Then he should see session error message

  Scenario: Signed in as a student
    Given the user signed in as a student
    When he visits the page for listing all students
    Then he should see session error message
    When he visits the page for creating a new student
    Then he should see session error message
    When he visits the page for the student with id 1
    Then he should not see the session error message

  Scenario: Signed in as a professor
    Given the user signed in as a professor
    When he visits the page for listing all students
    Then he should not see the session error message
    When he visits the page for creating a new student
    Then he should not see the session error message
    When he visits the page for the student with id 1
    Then he should not see the session error message