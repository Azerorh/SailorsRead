module ApplicationHelper

  def is_admin?
    if user_signed_in?
      current_user.is_admin
    end
  end

end
