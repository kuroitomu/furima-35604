class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index
  

  def index
    @purchase = PurchaseAddress.new
  end