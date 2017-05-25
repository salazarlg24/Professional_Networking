class UsersController < ApplicationController
	before_action :require_login, except: [:index,:login, :register]
  def index
  end
  def edit
  	@user = User.find(session[:user_id])
  end

  def update
  	user = User.find(session[:user_id])
  	user.update_attributes(name: params[:name], email: params[:email], description: params[:description])
  	if user.valid?
		redirect_to '/professional_profile'
	else
		flash[:errors] = user.errors.full_messages 
		redirect_to :back	
	end
  end

  def show
  	@users = User.all
  	@logged_in_user = User.find(session[:user_id])
  	@pending = Pending.find_by(inviter: session[:user_id])
  	@network = Network.find_by(user: session[:user_id])
  	# puts "**************"
  	# puts @pending.inviter.id
  	# puts "***************"
  	# puts @network
  	# puts "***************"
  end
  def profile
  	@user = User.find(params[:id])

  end

  def login
	@user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  	if (@user)
  		session[:user_id] = @user.id
  		redirect_to "/professional_profile"

  	else
		flash[:error] = "User information not found." 
		redirect_to :back	
	end
  end

  def register
  	@user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], description: params[:description])
	  	if @user.valid?
	  		session[:user_id] = @user.id
	  		puts 'User created'
	  		redirect_to "/professional_profile"		  	
		else
			flash[:errors] = @user.errors.full_messages 
			redirect_to :back
		end
  end

  def logout
  	session.clear
	redirect_to '/'
  end
end
