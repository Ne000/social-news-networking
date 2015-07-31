class CommentsController < ApplicationController
  def create
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params) 
    @comment.user = current_user
    
    if @comment.save
      flash[:notice] = "Comment was saved"
    else
      flash[:error] =  "Error saving comment"
    end
    redirect_to [@topic] 
  end
  
  def destroy
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment successfully removed."
      redirect_to [@topic]
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
      redirect_to [@topic]
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
