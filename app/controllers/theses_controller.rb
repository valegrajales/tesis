class ThesesController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter(except: :show) { |c| c.signed_in_filter USER_TYPE_PROFESSOR }
  before_filter(only: :show) { |c| c.signed_in_filter USER_TYPE_ANY }

  # ============
  # Actions
  # ============
  def new
    @thesis = Thesis.new
    get_students
  end

  def create
    # Saves the student by name and then deletes the parameter
    student_name = params[:student]
    student = Student.find_by_name student_name

    @thesis = Thesis.new(params[:thesis])
    student.thesis = @thesis
    if @thesis.save && student.save
      flash[:success] = 'Your thesis has been created successfully.'
      redirect_to @thesis
    else
      render 'new'
    end
  end

  def show
    @thesis = Thesis.find(params[:id])
  end

  def index
    @found_thesis = Thesis.all
  end

  private
  def get_students
    students = Student.all
    students.each_with_index do |student, index|
      if index < students.count - 1
        @students_list = "#{@students_list}\"#{student.name}\","
      else
        @students_list = "#{@students_list}\"#{student.name}\""
      end
    end
    @students_list = "[#{@students_list}]"
  end
end
