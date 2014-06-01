class UsersController < ApplicationController



  def new
    name = params[:name]
    email = params[:email]
    date = Time.now
    twitter = params[:twitter]
    type = params[:type]
    par = [name: name, email: email,date: date,twitter_token: twitter]
    @user = User.create(par)
    #get_challenges(@user,type)
    @challenge = Challenge.first
    @user << @challenge 

  end

  def create
    twitter = params[:twitter_token]
    unless params[:outraop].nil? == true ||  params[:outraop] == 'outrasopcoes' 
        op = false
    else
        op = true
    end
    date = Date.today
    par = [twitter_token: twitter,date: date]
    @user = User.create(par)

    count = 0
     n = Challenge.count
     while count < 3
        @challenge = Challenge.find(n)
        unless @challenge.nil? 
            @user << challenge
            count = count + 1
        else
            count = 10
        end
    end

    render root

  end


end

