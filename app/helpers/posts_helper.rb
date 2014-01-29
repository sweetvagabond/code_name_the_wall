module PostsHelper

	# def all_comments(comments_array = [])
	# 	comments = Post.where(parent_id: :post_id)
	# 	comments_array += comments.all
	# 	comments.each do |comment|
	# 		comment.all_comments(comments_array)
	# 	end
	# 	comments_array
	# end


	def test_print
		content = []
		# content << "<div>Fancy printy method</div>"
		content << content_tag(:p, "Hello world!", class: "strong")
	end

	def print_tree(post, content, counter)
		counter += 1
		if content.nil?
			content = []
			content << content_tag(:p, post.post, class: "root" )
		end
		if post.children.nil?
			return content
		else
			post.children.each_with_index do |child, index|
				# ADD THE CONTENT OF THIS POST TO THE CONTENT ARRAY
				content << content_tag(:p, child.post, class: "post"+counter.to_s )
				print_tree(child, content, counter)
			end
		end
		puts "======================"
		puts content
		puts "======================"
		return content
	end

end
