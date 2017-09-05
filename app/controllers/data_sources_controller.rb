class DataSourcesController < ApplicationController
  def index
    @data_sources = DataSource.all
    render json: @data_sources, status: :ok
  end
end
