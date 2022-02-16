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
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to root_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
end
