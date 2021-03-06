Rails.application.routes.draw do
  devise_for :users

  resources :receipts, only: %i[index] do
    post 'import', on: :collection
  end
  
  root 'receipts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
