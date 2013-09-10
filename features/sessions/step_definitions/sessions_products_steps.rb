# ============
# When steps
# ============
When(/^he visits the page for listing all products$/) do
  visit products_all_path @current_thesis.id
end

When(/^he visits the page for creating a new product$/) do
  visit new_product_path thesis_id: @current_thesis.id
end

When(/^he visits the page for the product with id (\d+)$/) do |id|
  FactoryGirl.create :product, thesis_id: @current_thesis.id, id: id.to_i
  visit product_path id.to_i
end