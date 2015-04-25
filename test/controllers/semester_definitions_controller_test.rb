require 'test_helper'

class SemesterDefinitionsControllerTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
    @winterim = FactoryGirl.create :semester_definition, name: "Winterim"
  end
    

  test "should create semester definition" do
    assert_difference('SemesterDefinition.count') do
      post :create, semester_definition: {name: "Test", in_year_position: 1}
  end
end

  test "should update semester definition name " do
    put :update, id: @winterim.id, semester_definition: { name: "Winterim 1" }
    assert_equal "Winterim 1", assigns(:semester_definition).name
  end

end
