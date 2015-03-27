require 'test_helper'

class YearsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get show" do
    get(:show, { id: 1 }) 
    assert_response :success
    assert_template :show
  end

  test "should create year" do
    assert_difference('CoursePlan.count') do
      post :create, year: { course_plan_id: 2 }
    end
    assert_redirected_to course_plan_path(assigns(:course_plan))
  end
end
