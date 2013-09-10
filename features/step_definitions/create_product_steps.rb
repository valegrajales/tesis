# ============
# Given steps
# ============

Given /^a user visits the create product page$/ do
  visit new_product_path(id: '1')
end

Given /^ without the id parameter$/ do
  visit new_product_path
end

# ============
# When steps
# ============
When /^he submits an empty product form$/ do
  fill_in 'Description', with: ''
  click_button 'Create product'
end

When /^he submits only the product description field$/ do
  fill_in 'Description', with: 'Any title whatsoever'
  click_button 'Create product'
end


When /^he submits the form with a product description longer than (\d+) characters$/ do |arg|
  fill_in 'Description', with: ('a' * (arg.to_i + 1))
  click_button 'Create product'
end

When /^he submits the product form correctly$/ do
  fill_in 'Description', with: 'Any description whatsoever'
  click_button 'Create product'
end



# ============
# Then steps
# ============

Then /^he should see a non blank product description error$/ do
  #page.should have_selector 'li.text-error', text: 'Description can\'t be blank'
end

Then /^he should see a too long product description error$/ do
  #page.should have_selector 'li.text-error', text: 'Description is too long (maximum is 100 characters)'
end

Then /^he should not see a too long product description error$/ do
  page.should_not have_selector 'li.text-error', text: 'Description is too long (maximum is 100 characters)'
end

Then /^he should see a success product flash message$/ do
  #page.should have_selector 'div.alert.alert-success', text: 'Your product has been created successfully.'
end

