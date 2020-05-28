Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    collection do
      get 'filter'
    end
  end
  resources :doses, only: :destroy
end
