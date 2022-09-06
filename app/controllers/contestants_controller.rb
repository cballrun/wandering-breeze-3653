class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.all

  end

  def contestant_params
    params.permit(:id, :name, :age, :hometown, :years_of_experience)
  end



end