class DataSourceController < ApplicationController
  def index
    @data_source = DataSource.find_by_player_id(params[:player_id])
    render json: @data_source, status: :ok
  end
end
