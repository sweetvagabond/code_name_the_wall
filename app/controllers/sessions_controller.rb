class SessionsController < ApplicationController
	def new
		@user.new
	end
	def create
		user = User.find_by(username: params[:session][:username]).try(:authenticate, params[:session][:password])
		if user == false || user.nil?
	      redirect_to :back, flash: { message: "Incorrect email/password" }
	    else
	      sign_in(user)
	      redirect_to :posts
	    end
	  end
	def destroy
		sign_out
		redirect_to :home
	end
end