class Public::CommentsController < ApplicationController
  def create
    oshi_log = OshiLog.find(params[:oshi_log_id])
    # comment = current_customer.comments.new(comment_params)
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    @comment.oshi_log_id = oshi_log.id
    @omment.save
    redirect_to request.referer
  end
  
  def destroy
    Comment.find_by(id: params[:id], oshi_log_id: params[:oshi_log_id]).destroy
    redirect_to request.referer
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
