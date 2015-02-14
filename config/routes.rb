Rails.application.routes.draw do

  resources :resultado_finals

  get "/resultado/final/:rf", :to => "resultado_finals#finalizar"

  resources :avaliacao_pre_projetos

  get "/avaliar_pre_projetos/:av", :to => "avaliacao_pre_projetos#avaliar_pre_projetos"

  resources :avaliacao_curriculos

  get "/avaliar_curriculos/:av", :to => "avaliacao_curriculos#avaliar_curriculos"

  resources :producao_cientificas

  resources :inscricaos

  resources :pessoas

  resources :processo_seletivos
  
  get "/processo_seletivos/processo_seletivos_abertos", :to => "processo_seletivos#processo_seletivos_abertos"

  get "/processo_seletivos/finalizar_processo_seletivo/:ps", :to => "processo_seletivos#finalizar_processo_seletivo"

  #resources :calendarios

  resources :pessoas
  
  resources :editals

  resources :linha_pesquisas

  resources :inscricaos

  devise_for :users
  
  scope "/admin" do
    resources :users#, :only =>[:index, :edit, :update, :show]
  end

  match "/cidades_por_estado" => "cidades#cidades_por_estado",  via: [:get, :post] 

  get 'system/index'

  get 'pages/info'
 
  get 'users/index'

  get 'users/show'
    
  root :to => redirect('system/index')



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
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
