class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params) 
    @comment.user = current_user
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment was saved"
    else
      flash[:error] =  "Error saving comment"
    end
    redirect_to [@topic, @post] 
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
