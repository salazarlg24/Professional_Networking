class PendingsController < ApplicationController
	before_action :require_login
  def create
  	user = User.find(params[:id])
  	logged_in_user = User.find(session[:user_id])
  	Pending.create(user: user, inviter: logged_in_user)
  	redirect_to '/professional_profile'
  end

  def destroy
  	Pending.find_by(user: session[:user_id]).destroy
  	redirect_to '/professional_profile'
  end
end
