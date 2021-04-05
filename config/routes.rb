Rails.application.routes.draw do
  resources :receipts, only: %i[new create] do
    post 'import', on: :collection
  end
  root 'receipts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
