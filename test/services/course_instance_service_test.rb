require 'test_helper'
class CourseInstancesServicesTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2015
    @fall = FactoryGirl.create :semester_definition, name: "Fall", id: 5, in_year_position:3
    @spring = FactoryGirl.create :semester_definition, name: "Spring", id:2, in_year_position:1
    @summer = FactoryGirl.create :semester_definition, name: "Summer", id:4, in_year_position:2
    @semester = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: @fall.id
    @course_instance = FactoryGirl.create :course_instance, semester_id: @semester.id, id:1
  end

  test "should find course instance with semester_id equal to 1" do
    context = {semester_id:@semester.id}
    result = CourseInstanceService.find(context)
    assert_equal result.new.get_semester_id, context[:semester_id]
  end

  # changed from fixtures to factory, there is only one course instance at the moment.
  test "should find one course instance with semester_id equal to 1" do
    context = {semester_id:@semester.id}
    result = CourseInstanceService.find(context)
    assert_equal result.length, 1
  end

  # There is one semester, which contains one course instance
  test "should find one course instance with year_id equal to 1" do
    context = {year_id:@year.id}
    result = CourseInstanceService.find_by_year(context)
    assert result.length == 1, "Only " + result.length.to_s + " course instances found"
    assert_equal result.pop, @course_instance
  end

  # There will be a total of three course instances, 2 of are in previous semesters
  test "should find course instances with in semesters previous to semester_id = 5(Fall def), and year_id=1" do
    semester = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: @spring.id
    semester2 =  FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: @summer.id
    course1 = FactoryGirl.create :course_instance, semester_id: semester.id
    course2 = FactoryGirl.create :course_instance, semester_id: semester2.id
    context = {semester_id:@semester.id} #@semester has fall as definition
    result = CourseInstanceService.find_before_semester(context)
    assert result.length == 2, "Only " + result.length.to_s + " course instances found"
    assert_equal result[0].id, course1.id, "result should be " + result[0].id.to_s
    assert_equal result[1].id, course2.id, "result should be " + result[1].id.to_s
  end

  # There will be a total of two course instances, 1 in each previous year
  test "should find course instances with in course plan for previous years, year = 2015" do
    year1 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2014
    year2 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2013
    semester = FactoryGirl.create :semester, year_id: year1.id, semester_definitions_id: @spring.id
    semester2 =  FactoryGirl.create :semester, year_id: year2.id, semester_definitions_id: @summer.id
    course1 = FactoryGirl.create :course_instance, semester_id: semester.id, id: 3
    course2 = FactoryGirl.create :course_instance, semester_id: semester2.id, id: 4
    # to make sure it doesn't get future years
    year3 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2016
    semester3 = FactoryGirl.create :semester, year_id: year3.id, semester_definitions_id: @summer.id
    FactoryGirl.create :course_instance, semester_id: semester3.id
    context = {year_id:@year.id} #@semester has fall as definition
    result = CourseInstanceService.find_before_year(context)
    assert result.length == 2, "Only " + result.length.to_s + " course instances found"
    assert_equal result[0].id, course2.id, "result should be " + result[0].id.to_s
    assert_equal result[1].id, course1.id, "result should be " + result[1].id.to_s
  end
  
end