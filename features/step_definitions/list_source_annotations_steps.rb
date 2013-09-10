# ============
# Given steps
# ============
Given /^there are no annotations for source with source_id (\d+)$/ do |source_id|
  # source_id for use in other steps
  @annotations_source_id = source_id.to_i
  # Making sure there are no annotations for that source_id
  annotations = SourceAnnotation.find_all_by_source_id @annotations_source_id
  annotations.each { |annotation| annotation.delete }
end

Given /^there are (\d+) annotations for source with source_id (\d+)$/ do |amount, source_id|
  # source_id for use in other steps
  @annotations_source_id = source_id.to_i
  # Making sure there are the correct amount of annotations for that source_id
  thesis = FactoryGirl.create :thesis
  source = FactoryGirl.create :source, thesis_id: thesis.id, id: @annotations_source_id
  amount.to_i.times { source.source_annotations.create title: 'Any title', content: 'Some content' }
end

# ============
# When steps
# ============
When /^he visits the page for listing its annotations$/ do
  visit source_annotations_all_path(@annotations_source_id)
end

# ============
# Then steps
# ============
Then /^he should see a list of (\d+) annotations$/ do |amount|
  page.all('div.list li').count.should == amount.to_i
end