class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:user_name], user_params[:password])

    if @user.nil?
       flash.now[:errors] = ["Invalid username or password. No cat for you."]
       render :new
    else
      login!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
