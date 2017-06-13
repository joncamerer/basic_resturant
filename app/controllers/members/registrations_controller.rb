class Members::RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    if resource.save
      flash.now[:success] = "Signed in!"
    else
      flash.now[:danger] = "error"
    end
  end
  
end