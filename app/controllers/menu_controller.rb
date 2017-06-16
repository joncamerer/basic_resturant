class MenuController < ApplicationController
  
  # Requires admin access
  def new
    @menu_item = Menu.new
  end
  
  
  def create
      @menu_item = Menu.new(menu_params)
      
      if @menu_item.save
        flash[:success] = "New Menu item saved!"
        redirect_to new_menu_path
      else
        flash[:danger] = @menu_item.errors.full_messages.join(", ")
        redirect_to new_menu_path
      end
    
  end
  
  
  def index
    # When user chooses a category option from dropdown menu 
    if params[:commit]
      @category = params[:category]
      # Clean up URL in user view and redirect to index
      redirect_to menu_index_path( type: @category )
    # If user has selectd a category and been redirected
    elsif params[:type]
      @menu_item = Menu.all
      # Assign desired items to display_menu, sanitize query params
      @display_menu = @menu_item.where( "category = ?", params[:type] )
    end
  end
  
  private
    def menu_params
      params.require(:menu).permit(:category, :name, :price, :description)
    end
end