# ============
# Given steps
# ============
Given(/^is working on a source with id (\d+)$/) do |id|
  @current_source = FactoryGirl.create :source, thesis_id: @current_thesis.id, id: id.to_i
end

# ============
# When steps
# ============
When(/^he visits the page for listing all annotations$/) do
  visit source_annotations_all_path @current_source.id
end

When(/^he visits the page for creating a new annotation$/) do
  visit new_source_annotation_path source_id: @current_source.id
end

When(/^he visits the page for the annotation with id (\d+)$/) do |id|
  FactoryGirl.create :source_annotation, source_id: @current_source.id, id: id.to_i
  visit source_annotation_path id.to_i
end