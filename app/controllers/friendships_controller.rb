class FriendshipsController < ApplicationController
	def create
		# @creep = current_user.follow!(Post.user_id)
		@user = User.find(params[:friendship][:followed_id])
		current_user.follow!(@user)
		redirect_to :back
	end	
end
