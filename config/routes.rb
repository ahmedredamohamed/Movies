Rails.application.routes.draw do
  root 'movies#index'
  get '/search', to: 'actors#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
