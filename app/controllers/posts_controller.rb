class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post #checks policy on new post resources. renders if satisfied.
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic
    #  initializing a new post associated with the current user, and passing a hash of post-specific, filtered params as the initialize argument.
    authorize @post
    
    if @post.save
      @post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    
    if @post.destroy
      flash[:notice] = "Post successfully deleted."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting this post. Please try again."
      render :show
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end


