module ApplicationHelper

  def is_admin?
    if user_signed_in?
      current_user.is_admin
    end
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

end
