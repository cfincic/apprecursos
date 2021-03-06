Apprecursos::Application.routes.draw do

  resources :areas

  resources :tipo_contrataciones

  resources :hijos

  resources :sedes

  resources :situacion_revistas

  resources :tipo_documentos  

  resources :agentes do
    collection do
      get 'autocomplete_agente_apellido'  
      get 'traer_lista_de_agentes'
    end
    get 'ver_preview_agente'
    get 'dar_de_baja'
    resources :dato_laborals do
    end
  end


  #resources :agentes

  get '/dato_laborals/obtener_direccion_madre'
  get '/dato_laborals/obtener_datos_de_sede'
  get '/agentes_csv' => 'agentes_csv#index'
  post '/agentes_csv' => 'agentes_csv#create', as: :agentes_csv_create
  get '/agentes_csv/show' => 'agentes_csv#show', as: :agentes_csv_show

  resources :agentes do
    resources :contactos
  end

  resources :agentes do
    resources :familiars
  end

  resources :agentes do
    resources :hijos
  end

  resources :agentes do
    resources :dato_contactos
  end

  root  'static_pages#home'
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
