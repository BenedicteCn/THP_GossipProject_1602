class CommentController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(content: params[:content], user_id: User.find_by(first_name: 'anonymous').id)
      if @comment.save
        redirect_to root_path, notice: "Nouveau potin bien créé !"
      else
        render file: './app/views/home.html.erb'
      end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)
    @comment.update(comment_params)
    redirect_to root_path
  end

  def destroy
    @comment = Comment.find(params[:gossip_id])
    @comment.destroy
    redirect_to root_path, :notice => "Le commentaire a bien été supprimé"
  end
end
