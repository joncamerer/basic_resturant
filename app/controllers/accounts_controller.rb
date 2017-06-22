class AccountsController < ApplicationController
  # Comment out to create example Loyalty Accounts
  before_action :authenticate_member!
  before_action :only_current_member
  
  # New and create actions should happen when card is used
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(account_params)
    @account.save
  end
  
  # GET to members/:member_id/account
  def show
    @card = current_member.card_number
    
    # Link Member to Account by Loyalty Card number upon first login
    if Account.where( "card_number = ?", "#{@card}" ).where( :member_id => nil ).exists?
      # Find loyalty account with matching card no.
      @accounts = Account.where( "card_number = ?", "#{@card}" )
      # Link loyalty account to member with matching card no.
      @accounts.update_all(member_id: "#{current_member.id}")
    end
    
    @account = Account.find_by("member_id = ?", "#{current_member.id}")
    @punches = @account.visit_count.digits.first
  end
  
  def update
    @account = Account.find_by("member_id = ?", "#{current_member.id}")
    @account.update_attributes( update_params )
    redirect_to loyalty_path
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
    
    def update_params
      params.require(:account).permit(:first_name, :last_name, :birthday)
    end

end