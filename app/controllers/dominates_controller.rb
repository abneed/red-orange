class DominatesController < ApplicationController
  before_action :set_dominate, only: [:update, :destroy]

  def update
    @dominate.save
    respond_to do |format|
      format.html { redirect_to @dominate.employee, notice: 'La habilidad del empleado fue exitosamente actualizado.' }
      format.json { head :no_content }
    end
  end

  def destroy
    employee = @dominate.employee
    @dominate.destroy
    respond_to do |format|
      format.html { redirect_to employee, notice: 'La habilidad del empleado fue exitosamente removido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dominate
      @dominate = Dominate.find(params[:id])
    end
end
