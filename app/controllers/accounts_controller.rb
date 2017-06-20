class AccountsController < ApplicationController
  before_action :authenticate_member!
  before_action :only_current_member
  
  def new
    @account = Account.new
  end
  
  def show
    @account = Account.all
  end
  
  def edit
  end

  private
    # Redirects user to their own account if they try to modify URL params
    def only_current_member
      if "#{current_member.id}" != "#{params[:member_id]}"
        redirect_to member_account_path(current_member.id)
      end
    end

end