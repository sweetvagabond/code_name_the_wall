class FriendshipsController < ApplicationController
	def create
		@user = User.find(params[:friendship][:followed_id])
		current_user.follow!(@user)
		redirect_to :back
	end	
end
