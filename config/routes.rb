Rails.application.routes.draw do
  scope '/v1' do
    resources :teams, only: [:show, :index] do
      resources :players, only: [:show, :index, :create, :update] do
        resources :player_seasons, only: [:show, :create, :update]
        resources :data_source, only:[:index]
      end
    end
    resources :data_sources, only: [:index]
  end
end
