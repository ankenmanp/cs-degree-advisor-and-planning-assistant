class CoursePlan < ActiveRecord::Base
  belongs_to :student
  has_many :years, -> {order "year ASC"}
  validates :student_id, presence: true
end
