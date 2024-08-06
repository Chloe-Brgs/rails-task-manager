Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # CREATE
  get  "tasks/new", to: "tasks#new", as: :new_task # get the form
  post "tasks",     to: "tasks#create"             # post parameters to create


  # READ
  get  "tasks",     to: "tasks#index"
  get "task/:id", to: "tasks#show", as: :task


  # UPDATE
  get "task/:id/edit", to: "tasks#edit", as: :edit # get the html form, pre-filled to edit
  patch "task/:id", to: "tasks#update" # patch parameters to update

  # UPDATE
  delete "task/:id", to: "tasks#destroy"


end


# # rails routes
# Prefix         Verb     URI Pattern                           Controller#Action
# restaurants    GET    /restaurants(.:format)                 restaurants#index
# new_restaurant GET     /restaurants/new(.:format)             restaurants#new
#                POST    /restaurants(.:format)                 restaurants#create
#  restaurant     GET    /restaurants/:id(.:format)             restaurants#show
# edit_restaurant GET    /restaurants/:id/edit(.:format)        restaurants#edit
#                PATCH   /restaurants/:id(.:format)             restaurants#update
#                DELETE  /restaurants/:id(.:format)             restaurants#destroy


# There are 7 CRUD routes
# Rails.application.routes.draw do
#   # Read all
#   get    "restaurants",          to: "restaurants#index"

#   # Create
#   get    "restaurants/new",      to: "restaurants#new",  as: :new_restaurant
#   post   "restaurants",          to: "restaurants#create"

#   # Read one - The `show` route needs to be *after* `new` route.
#   get    "restaurants/:id",      to: "restaurants#show", as: :restaurant

#   # Update
#   get    "restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
#   patch  "restaurants/:id",      to: "restaurants#update"

#   # Delete
#   delete "restaurants/:id",      to: "restaurants#destroy"
# end
