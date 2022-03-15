Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect('/frontend/Untitled-1.html')
  get "/login", :to => redirect('/frontend/Untitled-1.html')
  get "/articles", to: "articles#index"
  get "/articles_json", to: "articles#articles_json"
  # Defines the root path route ("/")
  # root "articles#index"
end
