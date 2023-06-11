class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @oshi_logs = @customer.oshi_logs
    @oshi_log = OshiLog.new
    @user_info = @customer
  end

  def edit
    @customer = Customer.find(params[:id])
    @user_info = current_customer
  end

  def index
    @customers =Customer.all
    @user_info = current_customer
    @oshi_log = OshiLog.new
  end

  def create
    @Customer = Customer.new(customer_params)
    @Customer.save
    redirect_to customer_path
  end

  def update
    @customer= Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def comfirm_withdraw
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :self_introduction, :oshi_name, :is_delited)
  end
end
