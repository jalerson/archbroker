class SessionsController < ApplicationController
  def login
  end

  def authenticate
  	user = User.authenticate(params[:email], params[:password])
  	if user
    	session[:user_id] = user.id
      if params[:original_url]
        redirect_to params[:original_url]
      else
        redirect_to root_url, :notice => "Welcome back #{user.username}!"
      end
  	else
      @user = User.new
    	redirect_to login_path, :alert => "Incorrect e-mail address and/or password!"
  	end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url
  end
end
