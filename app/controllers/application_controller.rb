class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_member!
  
  
  private
    # Allows additional categories for Devise sign up form
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:card_number])
    end
    
    # Redirect to loyalty_path when loyalty member signs up/in
    def after_sign_in_path_for(members)
      @member = current_member.id
      member_account_path( member_id: @member )
    end
    
    
    # Redirect to loyalty_path when loyalty member signs out
    def after_sign_out_path_for(members)
      loyalty_path
    end  
end
