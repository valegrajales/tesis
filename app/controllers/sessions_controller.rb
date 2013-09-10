class SessionsController < ApplicationController
  # ============
  # Actions
  # ============
  def new
  end

  def create
    user = params[:user]
    password = params[:password]

    # Dummy
    student = Student.find_by_username user
    if student.nil?
      sign_in user, USER_TYPE_PROFESSOR
    else
      sign_in student.id, USER_TYPE_STUDENT
    end

    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def error
  end
end
