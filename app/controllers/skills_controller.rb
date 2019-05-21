class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill::StoredProcedures.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    respond_to do |format|
      Skill::StoredProcedures.create(skill_params.values)
      if skill = Skill::StoredProcedures.find_last_created()
        format.html { redirect_to skill, notice: 'La habilidad fue creada exitosamente.' }
        format.json { render :show, status: :created, location: skill }
      else
        format.html { render :new }
        format.json { render json: skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      Skill::StoredProcedures.update(update_skill_params.values)
      if skill = Skill::StoredProcedures.find_last_updated()
        format.html { redirect_to skill, notice: 'La habilidad fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: skill }
      else
        format.html { render :edit }
        format.json { render json: skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    Skill::StoredProcedures.destroy(@skill.id)
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'La habilidad fue destruida exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill::StoredProcedures.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_skill_params
      params.permit(:id, :name, :description, :degree_of_difficulty)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name, :description, :degree_of_difficulty)
    end
end
