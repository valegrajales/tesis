#Feature: Create source
#  Scenario: Unsuccessful creation of a source
#    Given a user visits the create source page
#    When he submits an empty source form
#    Then he should see a non blank title error of source
#    And he should see a non blank description error of source
#    And he should not see a too long title error of source
#    And he should not see a non blank thesis_id error
#
# Scenario: Unsuccessful creation of a source
#    Given a user visits the create source page
#    When he submits only the title field of source
#    Then he should see a non blank description error of source
#    And he should not see a non blank title error of source
#    And he should not see a too long title error of source
#    And he should not see a non blank thesis_id error
#
##  Scenario: Unsuccessful creation of a source annotation
##    Given a user visits the create source annotation page
##    When he submits only the content field
##    Then he should see a non blank title error
##    And he should not see a non blank content error
##    And he should not see a too long title error
##    And he should not see a non blank source_id error
##
#  Scenario: Unsuccessful creation of a source
#    Given a user visits the create source page
#    When he submits the form with a source title longer than 100 characters
#    Then he should see a too long title error of source
#    And he should not see a non blank content error
#    And he should not see a non blank title error of source
#    And he should not see a non blank thesis_id error
##
##  Scenario: Unsuccessful creation of a source annotation
##    Given a user visits the create source annotation page without the source_id parameter
##    When he submits the form correctly
##    Then he should see a non blank source_id error
##    And he should not see a non blank content error
##    And he should not see a non blank title error
##    And he should not see a too long title error
##
##  Scenario: Successful creation of a source annotation
##    Given a user visits the create source annotation page
##    When he submits the form correctly
##    Then he should see a success flash message