class Members::RegistrationsController < Devise::RegistrationsController
  
  # POST /members, overrides devise controller
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :success, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :danger, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      # Displays sign up errors in flash
      flash.now[:danger] = "Uh Oh! We weren't able to sign you up...
        #{resource.errors.full_messages.join(", ")}"
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  
end