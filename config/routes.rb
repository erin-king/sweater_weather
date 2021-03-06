Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: 'welcome'

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'backgrounds#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end
  end

end
