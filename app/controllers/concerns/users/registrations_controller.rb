class Users::PasswordsController < Devise::PasswordsController
 protected
 def after_resetting_password_path_for(resource)
  session[:previous_url] || root_path
 end
end