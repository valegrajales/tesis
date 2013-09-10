# ============
# When steps
# ============
When /^he submits an empty form$/ do
  fill_in 'Title', with: ''
  fill_in 'Content', with: ''

  click_button 'Create annotation'
end

When /^he submits only the title field$/ do
  fill_in 'Title', with: 'Any title whatsoever'
  fill_in 'Content', with: ''

  click_button 'Create annotation'
end

When /^he submits only the content field$/ do
  fill_in 'Title', with: ''
  fill_in 'Content', with: 'Any content whatsoever'

  click_button 'Create annotation'
end

When /^he submits the form with a title longer than (\d+) characters$/ do |arg|
  fill_in 'Title', with: ('a' * (arg.to_i + 1))
  fill_in 'Content', with: 'Any content whatsoever'

  click_button 'Create annotation'
end

When /^he submits the form correctly$/ do
  fill_in 'Title', with: 'Any title whatsoever'
  fill_in 'Content', with: 'Any content whatsoever'

  click_button 'Create annotation'
end

# ============
# Then steps
# ============
Then /^he should see a non blank title error$/ do
  page.should have_selector 'li.text-error', text: 'Title can\'t be blank'
end

Then /^he should not see a non blank title error$/ do
  page.should_not have_selector 'li.text-error', text: 'Title can\'t be blank'
end

Then /^he should see a non blank content error$/ do
  page.should have_selector 'li.text-error', text: 'Content can\'t be blank'
end

Then /^he should not see a non blank content error$/ do
  page.should_not have_selector 'li.text-error', text: 'Content can\'t be blank'
end

Then /^he should see a too long title error$/ do
  page.should have_selector 'li.text-error', text: 'Title is too long (maximum is 100 characters)'
end

Then /^he should not see a too long title error$/ do
  page.should_not have_selector 'li.text-error', text: 'Title is too long (maximum is 100 characters)'
end

Then /^he should see a success flash message$/ do
  page.should have_selector 'div.alert.alert-success', text: 'Your annotation has been created successfully.'
end