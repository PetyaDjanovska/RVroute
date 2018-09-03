class CommentsController < ApplicationController
  def new
  end
  
  def create
    @campsite = Campsite.find_by(id: params[:campsite_id])
    @comment = @campsite.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to campsite_path(@campsite)
  end
  
  def index
    @comments = Comment.all
  end
  
 private
  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end