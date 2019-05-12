require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @employee = employees(:abneed)
    @skill = skills(:one)
  end

  test "associated dominates should be destroyed" do
    @employee.save
    @skill.save
    @employee.dominates.create!(skill_id: @skill.id, degree_of_dominance: 3)
    assert_difference 'Dominate.count', -1 do
      @employee.destroy
    end
  end
end
