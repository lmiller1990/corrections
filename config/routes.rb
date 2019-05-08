Rails.application.routes.draw do
  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'

  resources :posts do
    scope module: 'posts' do
      resources :corrections
    end
  end

  resources :jobs, only: %(index)
end
