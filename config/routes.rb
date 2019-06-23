Rails.application.routes.draw do
  resources :tasks
  resources :projects do
    resources :tasks, shallow: true do
      member do
        get :set_status
      end
      
      collection do
        put :update_status
      end
    end
    member do
      get :add_user
    end
    
    collection do
      post :add_user_to_project
    end
  end
  devise_for :users
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index" 
end
