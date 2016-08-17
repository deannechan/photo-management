class UserController < ApplicationController
  include UserHelper

  def login
    username = params[:username]
    password = params[:password]

    data = User.authenticate(username, password)

    if data[:errors].length > 0
      redirect_to("/login")
      session[:errors] = data[:errors]
    else
      session[:user_id] = data[:user].id if !data[:user].nil?
      session[:session_uuid] = data[:user].session_uuid if !data[:user].nil?
      redirect_to("/")
    end
  end

  def logout
    if session[:user_id] && User.exists?(id: session[:user_id])
      User.find(session[:user_id]).session_uuid = nil
    end
    session[:user_id] = nil
    session[:session_uuid] = nil
    redirect_to(root_path)
  end

  def register
    options = {
      username: params[:username],
      password: params[:password],
      is_admin: false,
    }
    data = User.new_user(options)

    if data[:errors].length > 0
      session[:errors] = data[:errors]
      redirect_to("/register")
    else
      redirect_to("/home")
    end
  end
end
