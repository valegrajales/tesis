# ============
# Given steps
# ============
Given /^a meeting exists$/ do
  thesis = FactoryGirl.create :thesis
  @the_meeting = thesis.meetings.create meeting_date: Date.today
end

Given /^a user visits the create meeting annotation page for that meeting$/ do
  visit meeting_path @the_meeting
  click_link 'New annotation'
end