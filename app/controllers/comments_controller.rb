class CommentsController < ApplicationController
before_action :set_post
	def new 
	
	end 

	def create 
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:success] = "Your comment was created successfully!"
			redirect_to root_path
		else 
			flash[:alert] = "Check the comment form, because something went horribly wrong."
			render root_path
		end 
	end 

	def edit 
	end 

	def update 
	end 

	def destroy 
		@comment = @post.comments.find(params[:id])

		@comment.destroy 
		flash[:success] = "Comment destroyed."
		redirect_to root_path
	end 
end 

private 
	def set_post
		@post = Post.find(params[:post_id])
	end 

	def comment_params
 	 	params.require(:comment).permit(:content)
	end
