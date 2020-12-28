Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  
  resources :users, only: :show 
    resources :prototypes do
      resources :comments, only: :create 
    
     
   end
 end


#ただコメントのコントローラーのアクションを指定してもパスの中にどのプロトタイプへのコメントなのを示す情報がないので
#  2つをリンクさせるため親と子の関係にする
#  resources :親となるコントローラー do
#   resources :子となるコントローラーとなる

