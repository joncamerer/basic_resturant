class AccountsController < ApplicationController
  #before_action :authenticate_member!
  #before_action :only_current_member
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(account_params)
    @account.save
  end
  
  def show
    
    # Link Member to Account based on card number
    @all = Account.all
    @card = current_member.card_number
    @account = @all.where( "card_number = ?", "#{@card}" )
    
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
    
    def account_params
      params.require(:account).permit(:visit_count, :loyalty_points, :card_number, :join_date, :last_visit)
    end

end