Rails.application.routes.draw do

  root 'sessions#new'

  resources :users do
    resources :rooms do
      put 'track' => 'room#track', as: :track
      put 'untrack' => 'room#untrack', as: :track
      resources :measures, only: [:index, :create, :show], :defaults => { :format => 'json' }
    end
  end

  resources :sessions

end
