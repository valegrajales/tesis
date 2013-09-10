# ============
# Then steps
# ============
Then /^he should see a "(.*)" message$/ do |msg|
  page.should have_selector 'p.lead', text: msg
end

Then /^he should not see a "(.*)" message$/ do |msg|
  page.should_not have_selector 'p.lead', text: msg
end