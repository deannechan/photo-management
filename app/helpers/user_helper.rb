module UserHelper
  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      session[:session_uuid] = nil
      redirect_to(root_path)
    return
  end

  def session_active?
    if session[:session_uuid] && current_user
      current_user.session_uuid == session[:session_uuid]
    else
      false
    end
  end

  def logged_in?
    current_user != nil && session_active?
  end

  def logged_in_as_admin?
    logged_in? && current_user.is_admin?
  end

  def redirect_to_login
    if !logged_in?
      redirect_to("/login")
    end
  end

  def redirect_from_admin
    if !logged_in_as_admin?
      redirect_to("/login")
    end
  end

  def redirect_to_home
    if session_active?
      redirect_to("/home")
    end
  end
end
