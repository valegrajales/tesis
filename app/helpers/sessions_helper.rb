module SessionsHelper
  # ============
  # Constants
  # ============
  USER_TYPE_STUDENT = 'STUDENT'
  USER_TYPE_PROFESSOR = 'PROFESSOR'
  USER_TYPE_ANY = 'ANY'

  # ============
  # Methods
  # ============
  def sign_in(user, type)
    set_session_cookies user, type
  end

  def sign_out
    delete_session_cookies
  end

  def signed_in?
    !cookies[:user].nil? && !cookies[:type].nil?
  end

  def signed_in_filter(type)
    if type.eql? USER_TYPE_ANY
      unless signed_in?
        redirect_to session_error_path
      end
    elsif type.eql? USER_TYPE_STUDENT
      unless signed_in? && student?
        redirect_to session_error_path
      end
    elsif type.eql? USER_TYPE_PROFESSOR
      unless signed_in? && professor?
        redirect_to session_error_path
      end
    end
  end

  def student?
    cookies[:type].eql? USER_TYPE_STUDENT
  end

  def professor?
    cookies[:type].eql? USER_TYPE_PROFESSOR
  end

  def current_user
    if student?
      @current_user ||= Student.find (cookies[:user])
      #else
      #TODO when is professor
    end
  end

  def set_session_cookies(user, type)
    cookies[:user] = user
    cookies[:type] = type
  end

  def delete_session_cookies
    cookies.delete :user
    cookies.delete :type
  end

  def current_student_thesis_path
    if current_user.thesis_id.nil?
      '#'
    else
      thesis_path current_user.thesis
    end
  end

  def current_student_path
    student_path cookies[:user]
  end
end
