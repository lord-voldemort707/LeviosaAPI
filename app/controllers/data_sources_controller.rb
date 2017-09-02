class DataSourcesController < ApplicationController
  def index
    @data_sources = DataSource.select(:id, :name, :player_id, :player_lookup)
    render json: @data_sources, status: :ok
  end
end
