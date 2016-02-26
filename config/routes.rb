Rails.application.routes.draw do

  root 'sessions#new'

  resources :users do
    resources :rooms do
      put 'track' => 'room#track', as: :track,  :defaults => { :format => 'json' }
      put 'untrack' => 'room#untrack', as: :untrack,  :defaults => { :format => 'json' }
      resources :measures, only: [:index, :create, :show], :defaults => { :format => 'json' }
    end
  end

  resources :sessions

end
