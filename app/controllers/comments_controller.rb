class CommentsController < ApplicationController
  def create
    @comment = Comment.create(params.require(:comment).permit(:user, :body)) 
    @comment.post = @post
    @comment.user = current_user
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end
end
