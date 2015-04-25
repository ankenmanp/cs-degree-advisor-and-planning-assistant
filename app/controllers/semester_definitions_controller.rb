class SemesterDefinitionsController < ApplicationController


  def create
    @semester_definition = SemesterDefinition.new(definition_params)
    if @semester_definition.save
      render :text => ""
    else
      render :text => "this didn't work"
    end
  end
  
  def update
    @semester_definition = SemesterDefinition.where(id: params[:id]).take
    @semester_definition.update(definition_params)
    render :text => ""
       
  end

    def definition_params
      params.require(:semester_definition).permit(:semester_id, :in_year_position, :name)
    end
end
