class CommentsController < ApplicationController
  def new
    @campsite = Campsite.find_by(id: params[:campsite_id])
    @comment = @campsite.comments.build
  end
  
  def create
    @campsite = Campsite.find_by(id: params[:campsite_id])
    @comment = @campsite.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to campsite_comments_path(@campsite)
  end
  
  def index
    @campsite = Campsite.find_by(id: params[:campsite_id])
    @comments = @campsite.comments
  end
  
 private
  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end