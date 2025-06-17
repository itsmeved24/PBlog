Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  devise_scope :user do
  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
