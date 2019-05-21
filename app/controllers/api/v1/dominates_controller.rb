class API::V1::DominatesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_dominate, only: [:show, :update, :destroy]

  # GET /api/v1/dominates
  # GET /api/v1/dominates.json
  def index
    @dominates = Dominate.all
  end

  # GET /api/v1/dominates/1
  # GET /api/v1/dominates/1.json
  def show
  end

  # POST /api/v1/dominates
  # POST /api/v1/dominates.json
  def create
    @dominate = Dominate.new(dominate_params)
    if @dominate.save
      render :show, status: :created, location: @dominate
    else
      render json: @dominate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/dominates/1
  # PATCH/PUT /api/v1/dominates/1.json
  def update
    if @dominate.update(dominate_params)
      render :show, status: :ok, location: @dominate
    else
      render json: @dominate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/dominates/1
  # DELETE /api/v1/dominates/1.json
  def destroy
    @dominate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dominate
      @dominate = Dominate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dominate_params
      params.require(:dominate).permit(:employee_id, :skill_id, :degree_of_dominance)
    end
end
