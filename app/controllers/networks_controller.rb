class NetworksController < ApplicationController
	before_action :require_login
	def index
		@user = User.find(session[:user_id])
		@invitations = Pending.where(user: @user) 
		@friends = Network.where(user: @user)
		@users = User.all
	end
	def create
		user = User.find(session[:user_id])
		friend = User.find(params[:id])
		Network.create(user: user, friend: friend)
		redirect_to '/pendings'
	end

	def destroy
	end
end
