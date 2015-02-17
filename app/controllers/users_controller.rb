class UsersController < ApplicationController
  def auth
    @user = User.create_or_find(auth_hash)
    if @user
      session[:user] = @user
      flash[:message] = "User: #{@user.name} has been successfully logged-in"
    else
      flash[:message] = "Unable to authenticate user, please try again"
    end
    redirect_to articles_path
  end

  def signout
    session.delete(:user) if session[:user]
    puts request.headers.keys
    redirect_to articles_path
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
