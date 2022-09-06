class ContestantProjectController < ApplicationController

  def create
    @cp = ContestantProject.create!(contestant_id: params[:contestant_id], project_id: params[:id])
    # redirect_to "projects/#{@cp.project_id}"
  end

  def contestant_params

  end

end