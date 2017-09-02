class TeamsController < ApplicationController
  def show
    @team = Team.find_by_code(params[:id])
    render json: @team, status: :ok, include: ['players']
  end

  def create

  end

end
