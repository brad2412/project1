Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/theaters", to: "theaters#index"
  get "/theaters/new", to: "theaters#new"
  get "/theaters/:id", to: "theaters#show"
  post "/theaters", to: "theaters#create"

  get "/movies", to: "movies#index"
  get "/movies/:id", to: "movies#show"

  get "theaters/:theater_id/movies", to: "theaters_movies#index"
  get "theaters/:theater_id/movies", to: "theaters/movies#index"
  
end
