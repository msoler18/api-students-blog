module PostsHelper
	def form_title 
    @post.new_record? ? "Create Post" : "Edit Post"		
	end
end
