class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :owned_post, only: [:edit, :update, :destroy]

	def index
	  @posts = Post.all.order('created_at DESC').page params[:page]
	end  

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:success] = "Your post has been created!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end


	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :image, :rating, :price, :location, :review)
	end

	def owned_post  
		unless current_user == @post.user
			flash[:success] = "That post doesn't belong to you!"
			redirect_to root_path
		end
	end  
end
