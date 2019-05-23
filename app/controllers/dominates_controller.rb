class DominatesController < ApplicationController
  before_action :set_dominate, only: [:edit, :update, :destroy]

  def new
    @dominate = Dominate.new
  end

  def edit
  end

  def create
    respond_to do |format|
      Dominate::StoredProcedures.create(create_dominate_params.values)
      if dominate = Dominate::StoredProcedures.find_last_created()
        format.html { redirect_to employees_path + "/#{dominate.employee_id}", notice: 'La habilidad del empleado fue exitosamente registrado.' }
        format.json { render :show, status: :created, location: employees_path + "/#{dominate.employee_id}" }
      else
        format.html { render :new }
        format.json { render json: dominate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      Dominate::StoredProcedures.update(update_dominate_params.values)
      if dominate = Dominate::StoredProcedures.find_last_updated()
        format.html { redirect_to employees_path + "/#{dominate.employee_id}", notice: 'La habilidad del empleado fue exitosamente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: dominate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Dominate::StoredProcedures.destroy(@dominate.id)
    respond_to do |format|
      format.html { redirect_to employees_path + "/#{@dominate.employee_id}", notice: 'La habilidad del empleado fue exitosamente removido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dominate
      @dominate = Dominate::StoredProcedures.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_dominate_params
      params.permit(:id, :employee_id, :skill_id, :degree_of_dominance)
    end

    def create_dominate_params
      create_params = params.require(:dominate).permit(:id, :employee_id, :skill_id, :degree_of_dominance)
      create_params = create_params.reverse_merge(:skill_id => params[:skill_id])
      create_params.reverse_merge(:employee_id => params[:employee_id])
    end

    def dominate_params
      params.require(:dominate).permit(:id, :employee_id, :skill_id, :degree_of_dominance)
    end
end
