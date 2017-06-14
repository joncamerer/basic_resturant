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
  end
  
  private
    def menu_params
      params.require(:menu).permit(:category, :name, :price, :description)
    end
end