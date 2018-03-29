class UsersController < ApplicationController

  def show
    if params["id"] != session[:user_id].to_s
      redirect_to "/", notice: "Please login"
    end
  end

  def index
    @users = User.all.order('email')
  end

  def new # /users/new
    @user = User.new
  end

  def update
    user = User.find_by(id: params["id"])
    user.email = params["email"]
    user.password = params["password"]
    user.first_name = params["first_name"]
    user.last_name = params["last_name"]
    user.save
    redirect_to "/users"
  end

  def destroy
    user = User.find_by(id: params["id"])
    user.delete
    redirect_to "/users"
  end

  def create

    @user = User.new
    @user.email = params["email"]
    @user.password = params["password"]
		@user.first_name = params["first_name"]
    @user.last_name = params["last_name"]
    
    if @user.save
      redirect_to "/users", notice: "Thanks for signing up"
    else
      render 'new'
    end
  end

end