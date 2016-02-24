Rails.application.routes.draw do

  root 'sessions#new'

  resources :users do
    resources :rooms do
      resources :measures, only: [:index, :create, :show], :defaults => { :format => 'json' }
    end
  end

  resources :sessions

end
