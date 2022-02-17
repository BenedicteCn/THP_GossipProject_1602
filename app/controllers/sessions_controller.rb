class SessionsController < ApplicationController
  def new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if @user && @user.authenticate([:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to '/', notice: "Hey #{user.first_name}, te voilà connecté"

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render file: './app/views/sessions/new.html.erb'
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
