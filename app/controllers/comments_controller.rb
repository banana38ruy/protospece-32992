class CommentsController < ApplicationController
  
  def create
       @comment = Comment.new(comment_params)
    if @comment.save
       redirect_to prototype_path(@comment.prototype)
    else 
      @prototype = @comment.prototype
      @comments = @prototype.comments.includes(:user)
      render "prototypes/show"
    end
  end






  private
  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])

 end
end 

#prototype.idがはいっていない
#そもそもなんdeprototype.idだけがはいらないのか
#コメントが空だからfalseになる
# prototype_comments POST   /prototypes/:prototype_id/comments(.:format)                                             comments#create
# formの情報を直した
# redirect_to prototype_path(@comment.prototype)でprototype_pathで詳細を確認したい
  # そのためには@commentを使って住所を使って生み出したい生み出された時@commentにはprototypeが紐付いてるから
  #  prototype_path(@comment.prototype)となる
  #アソシエーションを組むとnewした際に自動的に生み出されるものがある




