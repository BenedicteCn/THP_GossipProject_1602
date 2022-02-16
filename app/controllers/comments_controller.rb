class CommentsController < ApplicationController
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
  end

  def update
  end

  def destroy
  end
end
