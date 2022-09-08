Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /rs/ do
    root to: 'pages#home'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts, only: [:new, :index, :show, :edit]
    post '/posts/new', to: 'posts#create', as: 'create'
    get '/profile', to: 'pages#profile', as: 'profile'
    get '/myposts', to: 'pages#myposts', as: 'myposts'
    patch ':id/change_status', to: 'pages#change_status', as: 'change_status'
    patch ":id/update", to: "posts#update", as: 'update_post'
  end
end
