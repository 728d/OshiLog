class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @user_info = current_customer
    
    if @range == "User"
      @customer = Customer.looks(params[:search], params[:word])

    else
      @oshi_log = OshiLog.looks(@range, params[:search], params[:word])
      
    end
  end
end