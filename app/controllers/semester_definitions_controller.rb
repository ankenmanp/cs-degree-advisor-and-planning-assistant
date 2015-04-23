class SemesterDefinitionsController < ApplicationController


  def create
    @semester_definition = SemesterDefinition.new(definition_params)
  end

  def update
    @semester_definition.update(definition_params)
       
  end

    def definition_params
      params.require(:semester_definition).permit(:semester_id, :in_year_position, :name)
    end
end
