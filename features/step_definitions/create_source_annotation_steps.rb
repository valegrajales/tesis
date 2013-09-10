# ============
# Given steps
# ============
Given /^a user visits the create source annotation page$/ do
  thesis = FactoryGirl.create :thesis
  source = FactoryGirl.create :source, thesis_id: thesis.id, id: 1
  visit new_source_annotation_path(source_id: source.id)
end

Given /^a user visits the create source annotation page without the source_id parameter$/ do
  visit new_source_annotation_path
end

# ============
# Then steps
# ============
Then /^he should see a non blank source_id error$/ do
  page.should have_selector 'li.text-error', text: 'Source can\'t be blank'
end

Then /^he should not see a non blank source_id error$/ do
  page.should_not have_selector 'li.text-error', text: 'Source can\'t be blank'
end