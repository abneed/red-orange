require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Currency", with: @employee.currency
    fill_in "Dateofhire", with: @employee.dateOfHire
    fill_in "Department", with: @employee.department
    fill_in "Jobtitle", with: @employee.jobTitle
    fill_in "Name", with: @employee.name
    fill_in "Phone", with: @employee.phone
    fill_in "Subsidiary", with: @employee.subsidiary
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Currency", with: @employee.currency
    fill_in "Dateofhire", with: @employee.dateOfHire
    fill_in "Department", with: @employee.department
    fill_in "Jobtitle", with: @employee.jobTitle
    fill_in "Name", with: @employee.name
    fill_in "Phone", with: @employee.phone
    fill_in "Subsidiary", with: @employee.subsidiary
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
