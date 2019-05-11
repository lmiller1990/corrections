Rails.application.routes.draw do
  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :posts do
    scope module: 'posts' do
      resources :corrections
      resources :claim
    end
  end

  resources :my_posts, only: %i(index)

  resources :jobs, only: %i(index)
end
