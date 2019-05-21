class API::V1::SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_skill, only: [:show, :update, :destroy]

  # GET /api/v1/skills
  # GET /api/v1/skills.json
  def index
    @skills = Skill.all
  end

  # GET /api/v1/skills/1
  # GET /api/v1/skills/1.json
  def show
  end

  # POST /api/v1/skills
  # POST /api/v1/skills.json
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      render :show, status: :created, location: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/skills/1
  # PATCH/PUT /api/v1/skills/1.json
  def update
    if @skill.update(skill_params)
      render :show, status: :ok, location: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/skills/1
  # DELETE /api/v1/skills/1.json
  def destroy
    @skill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name, :description, :quantity)
    end
end
