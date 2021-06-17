# class PurchaseController < ApplicationController
#   before_action :authenticate_user!
#   before_action :item_find, only: [:index, :create]
#   before_action :move_to_index
  

#   def index
#     @purchase = PurchaseAddress.new
#   end

#   def create
#     @item_purchase = ItemPurchase.new(purchase_params)
#     if @item_purchase.valid?
#        pay_item
#        @item_purchase.save
#        redirect_to root_path
#     else
#         render action: :index
#     end
#   end

#   private

#   def purchase_params
#     params.require(:item_purchase).permit(:postal_code,:prefecture_id,:city,:address,:building,:phoneno).merge(item_id: @item.id,user_id: current_user.id,token: params[:token])
#   end