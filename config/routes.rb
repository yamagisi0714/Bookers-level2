Rails.application.routes.draw do
  resources :books
  devise_for :users
  # devise_for:usersがdeviseを使用する際にURLとしてuserを含むことを示します
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'root#top'
  get "/home/about" => 'root#about'
  resources :users
end
