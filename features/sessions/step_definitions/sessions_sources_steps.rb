# ============
# When steps
# ============
When(/^he visits the page for listing all sources$/) do
  visit sources_all_path @current_thesis.id
end

When(/^he visits the page for creating a new source$/) do
  visit new_source_path thesis_id: @current_thesis.id
end

When(/^he visits the page for the source with id (\d+)$/) do |id|
  FactoryGirl.create :source, thesis_id: @current_thesis.id, id: id.to_i
  visit source_path id.to_i
end