class TweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    puts "requeest \n\n\n"
    name =  params[:screen_name]
    tweet = params[:tweet]
    if name == "@andremitsuoka"
      note = Note.new
      #mudar aqui a string
      note.check_todo_in_note("surf")
      note.update
    end
    
    render nothing: true
  end
end
