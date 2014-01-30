module PostsHelper

	# def all_comments(comments_array = [])
	# 	comments = Post.where(parent_id: :post_id)
	# 	comments_array += comments.all
	# 	comments.each do |comment|
	# 		comment.all_comments(comments_array)
	# 	end
	# 	comments_array
	# end


	# def test_print
	# 	content = []
	# 	# content << "<div>Fancy printy method</div>"
	# 	content << content_tag(:p, "Hello world!", class: "strong")
	# end

	def follow_button(user_to_follow)
		if signed_in? && !current_user.following?(user_to_follow)
			form_tag(friendships_path, method: :post, authenticity_token: true) do
				hidden_field_tag("friendship[followed_id]", user_to_follow.id.to_s) +
				button_tag(:submit, class: 'follow_butts') do
				  content_tag(:small, 'Follow')
				end
			end
		end
	end


	def comment_box(post)
		if signed_in?
			form_tag(posts_path, method: :post, authenticity_token: true, class: 'comment_form') do
				hidden_field_tag("post_id", post.id) +
				text_field_tag("post[post]") + 
				button_tag(:submit)
			end
		end
	end

	def show_comment_button
		if signed_in?
			button_tag(:Comment, class: 'show_comment')
		end
	end


	def print_tree(post, content, counter)
		counter += 1
		if content.nil?
			content = []
			temp_html = link_to(post.user.username, user_path(post.user), class: "username user"+post.user.id.to_s) + follow_button(post.user) + content_tag(:p, post.post, class: "root" ) + comment_box(post) + show_comment_button
			content << temp_html
		end
		if post.children.nil?
			return content
		else
			post.children.each_with_index do |child, index|
				temp_html = link_to(child.user.username, user_path(child.user), class: "user"+child.user.id.to_s) + content_tag(:p, child.post, class: "post"+counter.to_s ) + comment_box(child) + show_comment_button
					# + follow_button(child.user)
				content << temp_html
				print_tree(child, content, counter)
			end
		end
		return content
		puts "+++++++++++++++++++++++++++++++"
		puts content
		puts "+++++++++++++++++++++++++++++++"
	end

end
