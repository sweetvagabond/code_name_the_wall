class PostsController < ApplicationController
  def index
    # get root posts
  	@posts = Post.where(post_id: nil).order("created_at DESC")
    @post = Post.new
    # @comments = all_comments()
  end
  def show

  end

  def new
    # @post = Post.new
    # redirect_to :back
  end

  def create
    @user = current_user
    # render text: params
    if(params[:post_id].nil?)
      @post = Post.new(post_params)
      if @user.posts += [@post]
          # render text: current_user
        redirect_to :back #same thing as :posts_index
      else
        redirect_to :back
      end
    else
      @post = Post.find(params[:post_id]).children.build(post_params)
      if @post.save && @user.posts += [@post]
        redirect_to :back
      else
        redirect_to :back
      end
    end
  end

  def destroy
  end

  def update
  end



  # def createComment
  #   @comment = Post.new(post_params)
  #   @user = current_user
  #     if @user.posts += [@comment]
  #         # render text: current_user
  #       redirect_to :back #same thing as :posts_index
  #     else
  #       redirect_to :back
  #     end
  # end

private
  def post_params
    params.require(:post).permit(:post)
  end


end
