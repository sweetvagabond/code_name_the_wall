class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def edit
  end

  def show
    @post = Post.new
  	@user = User.find(params[:id])
    @userposts = @user.posts

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in(@user) 
  		redirect_to :posts
  	else
  		redirect_to :back
  	end
  end

  def update
  end

private
  def user_params
  	params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
