class SessionsController < ApplicationController

  def destroy
    reset_session
    redirect_to "/"
  end

  def create
    @user = User.find_by(email: params["email"])
    if @user != nil
      if @user.authenticate(params["password"])
        session[:user_id] = @user.id
        redirect_to "/projects"
      else
        render "/sessions/new"
      end
    else
      render "/sessions/new"
    end
  end

end

