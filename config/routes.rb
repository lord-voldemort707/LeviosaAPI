Rails.application.routes.draw do
  scope '/v1' do
    resources :teams, only: [:show, :create] do
      resources :players, only: [:show, :create, :update] do
        resources :player_seasons, only: [:show, :create, :update]
      end
    end
  end
end
