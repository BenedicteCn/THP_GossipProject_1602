class UserController < ApplicationController

  def show
    @user = User.find(params['id'])
  end

  def new
  end

  def create
    @user = User.new(first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      age: params[:age],
      password: params[:password],
      city: City.find(params[:city_id])
      )
    if @user.save
      redirect_to root_path, notice: 'Tu viens de réussir à créer ton compte'
    else
      render :action => 'new'
    end
    end

end
