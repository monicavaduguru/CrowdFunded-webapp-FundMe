class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_location
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected
    def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation, :address, :phonenumber]

    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  if (request.fullpath != "/users/sign_in" &&
      request.fullpath != "/users/sign_up" &&
      request.fullpath != "/users/update" &&
      request.fullpath != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end
def after_sign_out_path_for(resource)
  session[:previous_url] || root_path
end
def after_sign_up_path_for(resource)
  'http://localhost:3000/fund_me/main.html'
  end

end

