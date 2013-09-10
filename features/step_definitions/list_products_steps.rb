# ============
# Given steps
# ============
Given /^there are no products for thesis with thesis_id (\d+)$/ do |thesis_id|
  # thesis_id for use in other steps
  @products_thesis_id = thesis_id.to_i
  # Making sure there are no products for that thesis_id
  products = Product.find_all_by_thesis_id @products_thesis_id
  products.each { |product| product.delete }
end

Given /^there are (\d+) products for thesis with thesis_id (\d+)$/ do |amount, thesis_id|
  # thesis_id for use in other steps
  @products_thesis_id = thesis_id.to_i
  # Making sure there are the correct amount of annotations for that source_id
  thesis = FactoryGirl.create :thesis, id: @products_thesis_id
  amount.to_i.times { thesis.products.create description: 'Any description' }
end

# ============
# When steps
# ============
When /^he visits the page for listing its products$/ do
  visit products_all_path(@products_thesis_id)
end

# ============
# Then steps
# ============
Then /^he should see a "(.*)"$ message/ do |msg|
  page.should have_selector 'p.lead', text: msg
end

Then /^he should see a list of (\d+) products$/ do |amount|
  page.all('div.list li').count.should == amount.to_i
end