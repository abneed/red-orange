if @employees
  json.array! @employees = @employees.is_a?(Array) ? @employees : [@employees], partial: 'employees/employee', as: :employee
end