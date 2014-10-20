Rails.application.routes.draw do

  get "tests/:test_id/take" => 'tests#take'
  match "questions/get_next" => 'questions#get_next', via: [:get, :post]
  post "questions/:id/update" => 'questions#update'

  resources :tests
  resources :questions
  resources :users

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
  post "lti/launch" => "lti#launch"
  get "tool_config(.xml)" => "lti#xml_config"

  get "/oauth/launch" => "oauth#oauth_launch", as: :oauth_launch
  get "/oauth2response" => "oauth#oauth_response", as: :oauth_response

  get '/foo', :to => redirect('/foo.html')
  get '/failure', to: redirect("/failure.html")
  get '/success', to: redirect("/success.html")
  get '/out_of_questions', to: redirect("/out_of_questions.html")

  root 'pages#index'
end
