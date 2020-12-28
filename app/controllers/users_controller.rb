class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
    
  end
end
#@prototypesは繰り返したいもの
#@user.prototypesは繰り返したいパーツを詰め込んだセット
#繰り返したいものにパーツを詰め込んだセットをusersのshowにインスタンス変数として送っている

