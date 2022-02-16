class PagesController < ApplicationController

  def home
    render file: './app/views/home.html.erb'
    @gossip = Gossip.all
  end

  def team
    render file: './app/views/team.html.erb'
  end

  def contact
    render file: './app/views/contact.html.erb'
  end

  def welcome
    render file: './app/views/welcome.html.erb'
    @first_name = params['first_name']
  end

end
