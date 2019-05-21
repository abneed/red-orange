class API::V1::EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /api/v1/employees
  # GET /api/v1/employees.json
  def index
    @employees = Employee.all
  end

  # GET /api/v1/employees/1
  # GET /api/v1/employees/1.json
  def show
  end

  # POST /api/v1/employees
  # POST /api/v1/employees.json
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render :show, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/employees/1
  # PATCH/PUT /api/v1/employees/1.json
  def update
    if @employee.update(employee_params)
      render :show, status: :ok, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/employees/1
  # DELETE /api/v1/employees/1.json
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :jobTitle, :subsidiary, :department, :currency, :phone, :dateOfHire)
    end
end