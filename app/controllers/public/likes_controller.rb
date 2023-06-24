class Public::LikesController < ApplicationController
  def create
    oshi_log = OshiLog.find(params[:oshi_log_id])
    like = current_customer.likes.new(oshi_log_id: oshi_log.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    oshi_log = OshiLog.find(params[:oshi_log_id])
    like = current_customer.likes.find_by(oshi_log_id: oshi_log.id)
    like.destroy
    redirect_to request.referer
  end
end
