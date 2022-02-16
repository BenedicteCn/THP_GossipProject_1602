class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title],content: params[:content], user_id: User.find_by(first_name: 'anonymous').id)
      if @gossip.save
        redirect_to root_path, notice: "Nouveau potin bien créé !"
      else
        render file: './app/views/layouts/gossips/new.html.erb'
      end
  end

  def show
    @user = User.find(params[:id])
  end

end
