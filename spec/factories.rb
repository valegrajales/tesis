FactoryGirl.define do
  factory :source do
    sequence(:description) { |n| "Description #{n}" }
    sequence(:title) { |n| "Title #{n}" }
    sequence(:reference) { |n| "Reference #{n}" }
    source_type_id 1
    thesis_id 1
  end

  factory :source_annotation do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:content) { |n| "Content #{n}" }
    source_id 1
  end

  factory :product do
    sequence(:description) { |n| "Description #{n}" }
    thesis_id 1
  end

  factory :meeting do
    meeting_date Date.today
    thesis_id 1
  end

  factory :meeting_annotation do
    sequence(:title) { |n| "Title #{n}"}
    sequence(:content)  { |n| "Content #{n}"}
    attachment_url 'https://github.com/batianusrey/sample_app/archive/master.zip'
    meeting_id 1
  end

  factory :thesis do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Description for thesis #{n}" }
    sequence(:teacher) { |n| "Teacher#{n} for thesis" }
  end

  factory :student do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:major) { |n| "Major #{n}" }
    sequence(:username) { |n| "Username#{n}" }
    sequence(:student_code) { |n| "Student code #{n}" }
    age 21
  end
end