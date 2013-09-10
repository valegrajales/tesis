# ============
# When steps
# ============
When(/^he visits the page for listing all students/) do
  visit students_path
end

When(/^he visits the page for creating a new student/) do
  visit new_student_path
end

# ============
# Then steps
# ============
When(/^he visits the page for the student with id (\d+)$/) do |id|
  FactoryGirl.create :student, id: id.to_i
  visit student_path id.to_i
end