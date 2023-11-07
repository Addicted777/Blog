class PostsController < ApplicationController
    
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @posts = Post.all
            if params[:query].present?
                @pagy, @posts = pagy(Post.search_posts(params[:query]))
            else
                @pagy, @posts = pagy(Post.all)
            end
    end 
 
    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to @post, :notice => 'Post successfully posted!'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post, :notice => 'Post updated successfully!'
        else
            render :edit
        end
    end
    
    def destroy
        @post.destroy
        redirect_to posts_path, :notice => 'Post deleted successfully!'
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :summary, :body, :image)
    end
end