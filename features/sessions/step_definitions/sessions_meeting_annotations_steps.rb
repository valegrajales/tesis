# ============
# Given steps
# ============
Given(/^is working on a meeting with id (\d+)$/) do |id|
  @current_meeting = FactoryGirl.create :meeting, thesis_id: @current_thesis.id, id: id.to_i
end

# ============
# When steps
# ============
When(/^he visits the page for creating a new meeting annotation$/) do
  visit new_meeting_annotation_path meeting_id: @current_meeting.id
end

When(/^he visits the page for the meeting annotations with id (\d+)$/) do |id|
  FactoryGirl.create :meeting_annotation, meeting_id: @current_meeting.id, id: id.to_i
  visit meeting_annotation_path id.to_i
end