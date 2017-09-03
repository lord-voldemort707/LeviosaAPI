class TeamsController < ApplicationController
  def index
    @teams = Team.all
    render json: @teams, status: :ok
  end

  def show
    @team = Team.find_by_code(params[:id])
    render json: @team, status: :ok, include: ['players']
  end

end
