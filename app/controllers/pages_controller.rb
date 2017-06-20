class PagesController < ApplicationController
  before_action :authenticate_member!
  
  # GET to / 
  def home
  end
  
  # GET to /about
  def about
  end
  
  # GET to /loyalty
  def loyalty
    if member_signed_in?
      redirect_to member_account_path( member_id: current_member.id )
    end
  end
  
  # GET to /location
  def location
  end

end