class User < ActiveRecord::Base
	

	has_many 	:friendships,
				dependent: :destroy,
				foreign_key: "follower_id"
	
	has_many	:reverse_friendships,
				dependent: :destroy,
				foreign_key: "followed_id",
				class_name: "Friendship"
	

	has_many 	:following,
				through: :friendships,
				source: :followed
	
	has_many	:followers,
				through: :reverse_friendships,
				source: :follower


	has_many 	:posts
	has_many 	:comments, as: :commentable
	validates 	:username, uniqueness: true, presence: true
	has_secure_password

	def follow!(followed)
		# relationships.create!(followed_id: followed.id)
		friendships.create!(followed_id: followed.id)
	end

	def following?(followed)
		friendships.find_by(followed_id: followed.id)
	end



end


