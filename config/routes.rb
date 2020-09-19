Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: :index
    end
  end
  root to: 'welcome#index'
end
