class PurchasersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:create, :index, :new]

  def index
    @purchaser_history = PurchaserHistory.new
  end

  def new
    @purchaser_history = PurchaserHistory.new
  end

  def create
    @purchaser_history = PurchaserHistory.new(purchaser_params)
    if @purchaser_history.valid?
      @purchaser_history.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_history).permit(:postal_code, :area_id, :city, :address_line1, :address_line2, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
