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
    if  params[:op] == 'estadio' 
        op = true
    else
        op = false
    end
    date = Date.today
    par = {twitter_token: twitter,date: date}
    puts par
    @user = User.create(par)

    count = 0
     n = Challenge.count

     while count < 3
        @challenge = Challenge.find(n)

        puts @challenge.name

        unless @challenge.nil? 
            @user.challenges << @challenge
            count = count + 1
        else
            count = 10
        end
    end

    note = Note.new
    #interar challenges
    note.add_challenge(@challenge,"false")
    note.save_new_todo

    render :show

  end

  def show

  end


end

