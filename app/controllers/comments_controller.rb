class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_post

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:success] = "You commented the hell out of that post!"
			redirect_to :back
		else
			render root_path
		end
	end

	def edit
		@comment = @post.comments.find(params[:id])
	end

	def update

		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end 

	def destroy

		@comment = @post.comments.find(params[:id])
		@comment.destroy
		flash[:success] = "Comment deleted :("
		redirect_to root_path
	end
	
	private

	def comment_params  
		params.require(:comment).permit(:comment)
	end

	def set_post  
		@post = Post.find(params[:post_id])
	end  


end
