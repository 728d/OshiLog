class Public::OshiLogsController < ApplicationController
  def index
    @oshi_logs = OshiLog.all
    @user_info = current_customer
    @Oshi_log = OshiLog.new
  end

  def edit
    @oshi_log = OshiLog.find(params[:id])
  end

  def show
    @oshi_log = OshiLog.find(params[:id])
    @user_info = @oshi_log.customer
    @oshilog_new = OshiLog.new
  end

  def create
    @oshi_log = OshiLog.new(oshi_log_params)
    @oshi_log.customer_id = current_customer.id
    if @oshi_log.save
      flash[:notice] = "You have created book successfully."
      redirect_to oshi_log_path(@oshi_log.id)
    else
      @oshi_logs = OshiLog.all
      @user_info = current_customer
      render :index
    end
  end

  def update
    @oshi_log = OshiLog.find(params[:id])
   if @oshi_log.update(oshi_log_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to oshi_log_path(@oshi_log.id)
   else
     render :edit
   end
  end

  def destroy
    oshi_log = OshiLog.find(params[:id])
    oshi_log.destroy
    redirect_to oshi_logs_path, method: :delete
  end
end

private
  def oshi_log_params
    params.require(:oshi_log).permit(:oshi_image, :oshi_name, :body, :tag, :is_published)
  end
