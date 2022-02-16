class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title],content: params[:content], user_id: User.find_by(first_name: 'anonymous').id)
      if @gossip.save
        redirect_to root_path, notice: "Nouveau potin bien créé !"
      else
        render file: './app/views/gossips/new.html.erb'
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
    puts "hello ça marche"
    puts params[:id]

    @gossip = Gossip.find(params[:id])

    puts @gossip

      if @gossip.destroy
        puts "ici"
      else
        puts "faux"
      end
    #@gossip.destroy
    #redirect_to root_path, :notice => "Le potin a bien été supprimé"
  end
end
