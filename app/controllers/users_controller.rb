class UsersController < ApplicationController
  before_filter :login_required, only: [ :account ]

	def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Welcome #{@user.username}!"
    else
      render "new"
    end
  end

  def account
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(allowed_parameters)
      redirect_to account_path, :notice => "Your account was updated successfully!"
    else
      render 'account'
    end
  end

  def request_password
    
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.reset_password(@user, @user.reset_password).deliver
      redirect_to root_path, :notice => "A new password was sent to your e-mail address!"
    else
      flash[:alert] = 'E-mail address not found!'
      render 'request_password'
    end
  end

  private

  def allowed_parameters
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
