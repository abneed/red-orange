class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee::StoredProcedures.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    respond_to do |format|
      Employee::StoredProcedures.create(employee_params.values)
      if employee = Employee::StoredProcedures.find_last_created()
        format.html { redirect_to employees_path + "/#{employee.id}", notice: 'El empleado fue creado con éxito.' }
        format.json { render :show, status: :created, location: employee }
      else
        format.html { render :new }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      Employee::StoredProcedures.update(update_employee_params.values)
      if employee = Employee::StoredProcedures.find_last_updated()
        format.html { redirect_to employees_path + "/#{employee.id}", notice: 'El empleado fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: employee }
      else
        format.html { render :edit }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    Employee::StoredProcedures.destroy(@employee.id)
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'El empleado fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee::StoredProcedures.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_employee_params
      params.permit(:id, :name, :job_title, :subsidiary, :department, :currency, :phone, :date_of_hire)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :job_title, :subsidiary, :department, :currency, :phone, :date_of_hire)
    end
end
