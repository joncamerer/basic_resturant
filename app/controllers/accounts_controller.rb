class AccountsController < ApplicationController
  before_action :authenticate_member!
  before_action :only_current_member
  
  def new
  end
  
  def show
  end
  
  def edit
  end

  private
    def only_current_member
      @member = Member.find( params[:member_id] )
      redirect_to root_path unless @member == current_member
    end

end