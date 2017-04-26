module SessionsHelper

  def authenticated_user_only
    redirect_to root_url unless current_user
  end
end