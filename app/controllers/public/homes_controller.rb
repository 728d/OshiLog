class Public::HomesController < ApplicationController
  def top
  end

  def about
  end
  
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
