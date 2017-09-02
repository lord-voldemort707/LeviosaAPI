Rails.application.routes.draw do
  scope '/v1' do
    resources :teams, only: [:show, :create] do
      resources :players, only: [:show, :create, :update] do
        resources :player_seasons, only: [:show, :create, :update]
        resources :data_source, only:[:index]
      end
    end
  end
end
