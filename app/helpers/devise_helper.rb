module DeviseHelper
  def devise_error_messages!
    if devise_error_messages?
      resource.errors.full_messages.map { |msg| msg }.join(", ")
    end
  end
  
  private  
    def devise_error_messages?
      !resource.errors.empty?
    end
    
    

end