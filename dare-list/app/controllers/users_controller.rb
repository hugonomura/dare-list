class UsersController < ApplicationController


#attr_accessible   :name,:email,:date
#attr_protected :twitter_token, :ever_token
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


end

