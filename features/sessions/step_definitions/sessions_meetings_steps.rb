# ============
# Then steps
# ============
When(/^he visits the page for listing all meetings$/) do
  visit meetings_all_path @current_thesis.id
end

When(/^he visits the page for creating a new meeting$/) do
  visit new_meeting_path thesis_id: @current_thesis.id
end

When(/^he visits the page for the meeting with id (\d+)$/) do |id|
  FactoryGirl.create :meeting, thesis_id: @current_thesis.id, id: id.to_i
  visit meeting_path id.to_i
end

When(/^he visits the page for editing the meeting with id (\d+)$/) do |id|
  visit edit_meeting_path id.to_i
end