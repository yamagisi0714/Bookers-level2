Rails.application.routes.draw do
  devise_for :users
  # devise_for:usersがdeviseを使用する際にURLとしてuserを含むことを示します
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ログイン認証に成功した場合にリダイレクトされるパス
  get 'top' => 'root#top' 
end
