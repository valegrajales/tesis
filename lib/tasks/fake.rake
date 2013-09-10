namespace :db do
  namespace :development do
    desc 'Create user records in the development database.'

    task :fake_library_data => :environment do
      require 'faker'

      # ============
      # Common methods
      # ============
      def random_date(params={})
        years_back = params[:year_range] || 5
        latest_year  = params [:year_latest] || 0
        year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
        month = (rand * 12).ceil
        day = (rand * 31).ceil
        series = [date = Time.local(year, month, day)]
        if params[:series]
          params[:series].each do |some_time_after|
            series << series.last + (rand * some_time_after).ceil
          end
          return series
        end
        date
      end

      def random_student_code
        year = (2005..2013).to_a.sample
        rest_of_code = (10000..30000).to_a.sample
        "#{year}#{rest_of_code}"
      end

      def random_student_username(name)
        name_parts = name.split(/ /)
        number = (10..100).to_a.sample

        # If the name is of two parts
        initials = "#{name_parts[0][0,1].downcase}"
        last_name = name_parts[1].downcase

        # If the name is of three parts or more
        if name_parts.count > 2
          initials = "#{name_parts[0][0,1].downcase}#{name_parts[1][0,1].downcase}"
          last_name = name_parts[2].downcase
        end

        "#{initials}.#{last_name}#{number}"
      end

      # ============
      # Thesis & Student
      # ============
      10.times do
        thesis = Thesis.new(
            title: "Thesis #{Faker::Lorem.sentence(1).to_s}",
            description: Faker::Lorem.sentence(18).to_s,
            teacher: "Ph.D. #{Faker::Name.name.to_s}"
        )
        thesis.save!

        name = Faker::Name.name.to_s
        student = Student.new(
            name: name,
            major: "Administration of #{Faker::Lorem.word.to_s}",
            student_code: random_student_code.to_s,
            username: random_student_username(name),
            age: 21
        )
        student.thesis = thesis
        student.save!
      end

      # ============
      # Source
      # ============
      5.times do
        thesis = Thesis.first
        source = thesis.sources.build(
            title: Faker::Lorem.sentence(1).to_s,
            description: Faker::Lorem.sentence(1).to_s,
            source_type_id: rand(1..5),
            reference: Faker::Name.name.to_s
        )
        source.save!
      end

      5.times do
        thesis = Thesis.last
        source = thesis.sources.build(
            title: Faker::Lorem.sentence(1).to_s,
            description: Faker::Lorem.sentence(1).to_s,
            source_type_id: rand(1..5),
            reference: Faker::Name.name.to_s
        )
        source.save!
      end

      # ============
      # Product
      # ============
      5.times do
        thesis = Thesis.first
        product = thesis.products.build(description: Faker::Lorem.sentence(1).to_s)
        product.save!
      end

      5.times do
        thesis = Thesis.last
        product = thesis.products.build(description: Faker::Lorem.sentence(1).to_s)
        product.save!
      end

      # ============
      # SourceAnnotation
      # ============
      10.times do
        source = Source.first
        source_annotation = source.source_annotations.build(
            title: Faker::Lorem.sentence(1).to_s,
            content: Faker::Lorem.paragraph(1).to_s
        )
        source_annotation.save!
      end

      # ============
      # Meeting
      # ============
      10.times do
        thesis = Thesis.first
        meeting = thesis.meetings.build(meeting_date: random_date(year_range: 3, year_latest: 1))
        meeting.save!
      end

      # ============
      # MeetingAnnotation
      # ============
      5.times do
        meeting = Meeting.first
        meeting_annotation = meeting.meeting_annotations.build(title: Faker::Lorem.sentence(1).to_s,
                                                               content: Faker::Lorem.paragraph(1).to_s
        )
        meeting_annotation.save!
      end

      5.times do
        meeting = Meeting.last
        meeting_annotation = meeting.meeting_annotations.build(title: Faker::Lorem.sentence(1).to_s,
                                                               content: Faker::Lorem.paragraph(1).to_s,
                                                               attachment_url: 'https://bitbucket.org/procesosagiles/tesis/get/master.zip'
        )
        meeting_annotation.save!
      end
    end
  end
end