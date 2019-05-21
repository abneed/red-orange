class API::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /api/v1/items
  # GET /api/v1/items.json
  def index
    @items = Item.all
  end

  # GET /api/v1/items/1
  # GET /api/v1/items/1.json
  def show
  end

  # POST /api/v1/items
  # POST /api/v1/items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      render :show, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/items/1
  # PATCH/PUT /api/v1/items/1.json
  def update
    if @item.update(item_params)
      render :show, status: :ok, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/items/1
  # DELETE /api/v1/items/1.json
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :quantity)
    end
end
