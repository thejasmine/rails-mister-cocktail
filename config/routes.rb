Rails.application.routes.draw do
  root to: 'cocktails#home'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    collection do
      get 'filter'
      get 'recommendations'
    end
  end
  resources :doses, only: :destroy
end
