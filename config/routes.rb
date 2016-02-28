Rails.application.routes.draw do

  root 'sessions#new'

  resources :users do
    resources :rooms do
      put 'track' => 'rooms#track', as: :track,  :defaults => { :format => 'json' }
      put 'untrack' => 'rooms#untrack', as: :untrack,  :defaults => { :format => 'json' }
      resources :measures, only: [:index, :create, :show], :defaults => { :format => 'json' }
    end
  end

  scope :sessions do
    delete '' => 'sessions#sign_out', as: :sign_out,  :defaults => { :format => 'json' }
  end

  resources :sessions

end
