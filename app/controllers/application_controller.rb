class ApplicationController < ActionController::Base
  include UserHelper
  include ErrorHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :redirect_to_login, except: [:index, :login, :register]
  before_action :redirect_from_admin, only: [:admin]
  before_action :redirect_to_home, only: [:index, :login, :register]

  def index
    redirect_to("/login")
  end

  def login
    @errors = get_errors
  end

  def register
    @errors = get_errors
  end


  def home
    @errors = get_errors
  end

  def admin
    # @users = User.all
    # @images = Image.all
    # @taftentrance1 = @images.where(name: "taftentrance1")
    # @taftentrance2 = @images.where(name: "taftentrance2")
  end


end
