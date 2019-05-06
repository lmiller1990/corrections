Rails.application.routes.draw do
  resources :posts do
    scope module: 'posts' do
      resources :corrections
    end
  end
end
