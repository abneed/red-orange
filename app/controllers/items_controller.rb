class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item::StoredProcedures.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    respond_to do |format|
      Item::StoredProcedures.create(item_params.values)
      if item = Item::StoredProcedures.find_last_created()
        format.html { redirect_to items_path + "/#{item.id}", notice: 'El artículo fue creado con éxito.' }
        format.json { render :show, status: :created, location: items_path + "/#{item.id}" }
      else
        format.html { render :new }
        format.json { render json: item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      Item::StoredProcedures.update(update_item_params.values)
      if item = Item::StoredProcedures.find_last_updated()
        format.html { redirect_to items_path + "/#{item.id}", notice: 'El artículo fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: items_path + "/#{item.id}" }
      else
        format.html { render :edit }
        format.json { render json: item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    Item::StoredProcedures.destroy(@item.id)
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'El artículo fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item::StoredProcedures.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_item_params
      params.permit(:id, :name, :description, :quantity)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :quantity)
    end
end
