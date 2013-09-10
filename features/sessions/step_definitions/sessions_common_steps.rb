# ============
# Given steps
# ============
Given(/^is working on a thesis with id (\d+)$/) do |id|
  @current_thesis = FactoryGirl.create :thesis, id: id.to_i
end

Given(/^the user is not signed in$/) do
  delete logout_path
end

Given(/^the user signed in as a student$/) do
  FactoryGirl.create :student, username: 'student'
  visit signin_path
  fill_in 'User', with: 'student'
  fill_in 'Password', with: 'student'
  click_button 'Sign in'
end

Given(/^the user signed in as a professor$/) do
  visit signin_path
  fill_in 'User', with: 'professor'
  fill_in 'Password', with: 'professor'
  click_button 'Sign in'
end

# ============
# Then steps
# ============
Then(/^he should see session error message$/) do
  step "he should see a \"It seems you don't have the permission to access this page.\" message"
end

Then(/^he should not see the session error message$/) do
  step "he should not see a \"It seems you don't have the permission to access this page.\" message"
end