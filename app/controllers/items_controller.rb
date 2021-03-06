class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:             [:edit, :show, :update, :destroy]
  before_action :set_user, only:             [:edit, :update, :destroy]

  def index
      @items = Item.order("created_at DESC")
  end

  def new
      @item = Item.new
  end

  def create
      @item = Item.new(item_params) 
   if @item.valid?
      @item.save
      redirect_to root_path
   else
      render :new
    end
  end

  def show
     
  end

  def edit 

  end

  def update
   if @item.update(item_params)
      redirect_to item_path
   else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def item_params
      params.require(:item).permit(:name, :product_explanation, :category_id, :product_status_id, :shipping_charges_id, :prefecture_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
      @item = Item.find(params[:id])
  end

  def set_user
    redirect_to root_path if current_user.id != @item.user_id || @item.order != nil
  end
 end
  
