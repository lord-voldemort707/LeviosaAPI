class PlayersController < ApplicationController
  def index
    @team_id = Team.find_by_code(params[:team_id])
    @players = Player.where(team_id: @team_id)
    render json: @players, status: :ok, include: ['player_seasons']
  end

  def show
    @player = Player.find(params[:id])
    render json: @player, status: :ok, include: ['player_seasons']
  end

  def create
    @player = Player.create!(player_params)
    render json: @player, status: :created
  end

  def update
    @player = Player.find(params[:id]).update(player_params)
    head :no_content
  end

  private

  def player_params
    params.permit(:name, :nhl_rights, :position)
  end
end
