Rails.application.routes.draw do
  resources :foos
  resources :grupos

  resources :redes
  resources :equipes
  resources :sub_equipes
  resources :celulas
  resources :cargos

  resources :usuarios do
    get 'reset_password', on: :member
    post 'change_grupo', on: :member
    get 'ativar', on: :member
    get 'bloquear', on: :member
  end

  get 'users', to: 'usuarios#index'

  devise_for :users, controllers: {
                 confirmations: 'users/confirmations',
                 omniauth: 'users/omniauth',
                 passwords: 'users/passwords',
                 registrations: 'users/registrations',
                 sessions: 'users/sessions',
                 unlocks: 'users/unlocks'
                   }

  resources :igrejas do
    get 'buscar_cidades', on: :collection
    post 'add_contato', on: :collection
  end

  resources :membros do
    resources :contribuicoes

    collection do
      match 'search' => 'membros#search', via: [:get, :post], as: :search
      match 'report' => 'membros#report', via: [:get, :post], as: :report
    end
  end

  resources :tipo_contribuicoes

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resour  ce route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
