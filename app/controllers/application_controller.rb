class ApplicationController < ActionController::Base
  def signed_in_user
    unless user_signed_in?
      flash.alert="please login"
      redirect_to '/users/sign_in'
    end
  end
  # def signed_in_student
  #   unless student_signed_in?
  #     flash.alert="please login"
  #     redirect_to '/students/sign_in'
  #   end
  # end
end
