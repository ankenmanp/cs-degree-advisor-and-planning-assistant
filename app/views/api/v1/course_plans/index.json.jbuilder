json.course_plans @course_plans do |course_plan|
  json.created_at       course_plan.created_at
  json.id               course_plan.id
  json.student_id       course_plan.student_id
end
