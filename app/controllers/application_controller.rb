class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
    # Redirect to loyalty_path when loyalty member signs up/in
    def after_sign_in_path_for(members)
      loyalty_path    
    end
    
    # Redirect to loyalty_path when loyalty member signs out
    def after_sign_out_path_for(members)
      loyalty_path
    end  
end
