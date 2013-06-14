class SessionsController < ApplicationController

  def new
  end

  def create
  	staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff && staff.authenticate(params[:session][:password])
      sign_in staff
      redirect_to stores_path
    else
    	render 'new'
    end
  end


end
