class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params) 
    @comment.user = current_user
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment was saved"
    else
      flash[:error] =  "Error saving comment"
    end
    redirect_to :back
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @user = current_user
    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment successfully removed."
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
    end
      
    respond_to do |format| 
      format.html
      format.js
    end
  
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
