Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'merchants/:id/dashboard', to: 'merchants#show'
  get 'merchants/:id/items', to: 'items#index'
  get 'merchants/:id/items/:item_id', to: 'items#show'
  get 'merchants/:id/items/:item_id/edit', to: 'items#edit'
  patch 'merchants/:merchant_id/items/:item_id', to: 'items#update'
  get 'merchants/:id/invoices', to: 'invoices#index'

end
