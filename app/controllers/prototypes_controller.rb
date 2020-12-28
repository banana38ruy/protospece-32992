class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  #  before_action :set_prototype, only: [:edit, :show]


  def index
    @prototype = Prototype.new 
    @prototypes = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
     if @prototype.save
        redirect_to prototypes_path(@prototype)
     else
       render :new
     end
  end
  
  def show
   @prototype = Prototype.find(params[:id])
   @comment = Comment.new
   @comments = @prototype.comments.includes(:user)  
  end
 
  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save 
       redirect_to prototype_path(@prototype)
    else
     render :edit
  end
 end
 
 
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end

   def move_to_index
     unless user_signed_in? && current_user.id == @prototype.user.id
       redirect_to action: :index
     end
   end
end

# find(params[:id])は指定したカラムの情報を探して取得している
# 2,destroyと同じでビューに分け渡すわけじゃないので＠は使わない
# 3,viewにわたすために@を使う？
# 4,updateに関してだがrenderが:editだと入力仕掛けた他の情報まで消えてしまう
# 5,何故ならif elseの流れでインスタンス変数にしていなかったので保存できずにrenderで飛んだ場合  
# ６，一時的に保持していた情報がまっさらになる
# ７，updateを使う場合はこのケースではprototypeに＠をつけなければならない
# プロトタイプのコメントたちはユーザーに紐付いている = @prototype.comments.includes(:user) 




