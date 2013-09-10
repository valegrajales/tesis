class StudentsController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter(except: :show) { |c| c.signed_in_filter USER_TYPE_PROFESSOR }
  before_filter(only: :show) { |c| c.signed_in_filter USER_TYPE_ANY }

  # ============
  # Actions
  # ============
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])

    if @student.save
      flash[:success] = 'The student has been added successfully.'
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

end
