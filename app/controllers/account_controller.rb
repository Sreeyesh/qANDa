class AccountController < ApplicationController
  before_action :require_login, :only => [:show]
  layout :resolve_layout

  def index

  end

  def show

  end

  def sign_in
  	if request.post?
  		user = User.where(signin_user_params).first unless signin_user_params.nil?

  		if user
  			create_current_user_session user.email
  			redirect_to root_path
  		else
  			@user_not_exist = true
  		end
  	end

  end

  def sign_up

  	  if request.post?
  		user = User.create(user_params) unless user_params.nil?
  		if user
  			create_current_user_session user.email
  			redirect_to root_path
  		else
  			@user_not_created = true
  		end
  	end
  end

  def sign_out
  	reset_session
  	redirect_to root_path
  end

  private 
  def resolve_layout
  	case action_name
  	when "show"
  		"application"
  	else
	  	"login_layout"
	  end
  end

  def user_params
  	if params[:user][:password] == params[:user][:confirm_password]
  		params.require(:user).permit(:email, :password)
  	else
  		return nil
  	end
  	
  end

  def signin_user_params
  	params.require(:user).permit(:email, :password)
  end

  # def require_login
  # 	unless current_user_email
  # 		redirect_to login_url
  # 	end
  # end
end
