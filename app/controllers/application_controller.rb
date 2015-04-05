class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :year_notice, :semester_notice, :course_instance_notice
  private
    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end 
end
