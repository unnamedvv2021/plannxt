Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect('/frontend/Untitled-1.html')
  get "/login", :to => redirect('/frontend/Untitled-1.html')
  get "/articles", to: "articles#index"
  get "/articles_json", to: "articles#articles_json"
  get "/edit_page", to: "plan_models#edit_page"
  
  resources :plan_models
  #get "/plan_models", to: "plan_models#index"
  #get "/plan_models/:id", to: "plan_models#show"
  #post "/plan_models/update/:id", to: "plan_models#update"
  # Defines the root path route ("/")
  # root "articles#index"
end
