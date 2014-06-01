class TweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    puts params[:tweet]
    
    render nothing: true
  end
end
