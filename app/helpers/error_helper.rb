module ErrorHelper
  def get_errors
    errors = session[:errors]
    session[:errors] = nil
    errors ? errors : []
  end
end
