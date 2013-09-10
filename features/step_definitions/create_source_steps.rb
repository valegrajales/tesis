=begin
# ============
# Given steps
# ============
Given /^a user visits the create source page$/ do
  visit new_source_path(thesis_id: '1')
end

Given /^a user visits the create source page without the thesis_id parameter$/ do
  visit new_source_path
end

# ============
# Then steps
# ============
Then /^he should see a non blank thesis_id error$/ do
  page.should have_selector 'li.text-error', text: 'Thesis can\'t be blank'
end

Then /^he should not see a non blank thesis_id error$/ do
  page.should_not have_selector 'li.text-error', text: 'Thesis can\'t be blank'
end

When /^he submits an empty source form$/ do
#  fill_in 'Title', with: ''
#  fill_in 'Description', with: ''

  click_button 'Create source'
end

When /^he submits only the title field of source$/ do
  #fill_in 'Title', with: 'Any title whatsoever'
  #fill_in 'Description', with: ''

  click_button 'Create source'
end

When /^he submits only the content field of source$/ do
  fill_in 'Title', with: ''
  fill_in 'Description', with: 'Any description whatsoever'

  click_button 'Create source'
end

When /^he submits the source form with a title longer than (\d+) characters$/ do |arg|
  fill_in 'Title', with: ('a' * (arg.to_i + 1))
  fill_in 'Description', with: 'Any description whatsoever'

  click_button 'Create source'
end

When /^he submits the source form correctly$/ do
  fill_in 'Title', with: 'Any title whatsoever'
  fill_in 'Description', with: 'Any content whatsoever'

  click_button 'Create source'
end

When /^he submits the form with a source title longer than (\d+) characters$/ do |arg|
  fill_in 'Title', with: ('a' * (arg.to_i + 1))
  fill_in 'Description', with: 'Any content whatsoever'

  click_button 'Create source'
end

When /^he submits the form with a title source longer than (\d+) characters$/ do |arg|
  fill_in 'Title', with: ('a' * (arg.to_i + 1))
  fill_in 'Description', with: 'Any content whatsoever'

  click_button 'Create source'
end

# ============
# Then steps
# ============
Then /^he should see a non blank title error of source$/ do
  page.should have_selector 'li.text-error', text: 'Title can\'t be blank'
end

Then /^he should not see a non blank title error of source$/ do
  page.should_not have_selector 'li.text-error', text: 'Title can\'t be blank'
end

Then /^he should see a non blank description error of source$/ do
  page.should have_selector 'li.text-error', text: 'Description can\'t be blank'
end

Then /^he should not see a non blank description error of source$/ do
  page.should_not have_selector 'li.text-error', text: 'Description can\'t be blank'
end

Then /^he should see a too long title error of source$/ do
  page.should have_selector 'li.text-error', text: 'Title is too long (maximum is 100 characters)'
end

Then /^he should not see a too long title error of source$/ do
  page.should_not have_selector 'li.text-error', text: 'Title is too long (maximum is 100 characters)'
end

Then /^he should see a success flash message of source$/ do
  page.should have_selector 'div.alert.alert-success', text: 'Your source has been created successfully.'
end
=end
