require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
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

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { name: "computer science 1", subject: "CS", call_number: 1050, credit_hours: 4, description: "this is a description" }
    end
    assert_redirected_to course_path(assigns(:course))
  end

end