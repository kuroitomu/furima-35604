class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_purchase_set,  only: [:index, :create]
  before_action :set_user,           only: [:index, :create]

  def index
     @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(item_purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_purchase_set
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_params[:token],
      currency: 'jpy'
    )
  end

    def set_user
      redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
    end
  end