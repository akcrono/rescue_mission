class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_omniauth(env['omniauth.auth'])

    session[:user_id] = @user.id
    flash[:notice] = "signed in!"
    redirect_to '/'

  end

    def destroy
    session[:user_id] = nil
    flash[:notice] = "signed out!"

    redirect_to '/'

  end

end
