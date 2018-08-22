Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mail_boxes
  resources :emails, only: [:index, :show, :update] do
    member do
      get 'get_employees'
    end
    resources :email_replies, only: [:create, :new]
  end
  root 'emails#index'
end
