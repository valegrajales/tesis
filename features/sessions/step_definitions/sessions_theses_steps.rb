# ============
# When steps
# ============
When(/^he visits the page for listing all theses$/) do
  visit theses_path
end

When(/^he visits the page for creating a new theses$/) do
  visit new_thesis_path
end

# ============
# Then steps
# ============
When(/^he visits the page for the thesis with id (\d+)$/) do |id|
  FactoryGirl.create :thesis, id: id.to_i
  visit thesis_path id.to_i
end