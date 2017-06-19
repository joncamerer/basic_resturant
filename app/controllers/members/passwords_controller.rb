class Members::PasswordsController < Devise::PasswordsController

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      flash.now[:danger] = "Uh Oh! We've run into a problem... 
        #{resource.errors.full_messages.join(", ")}"
      respond_with(resource)
      
    end
  end

end