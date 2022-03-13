Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect('/frontend/Untitled-1.html')
  get "/login", :to => redirect('/frontend/Untitled-1.html')
  #get "/floor", to: "floor#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
