class TweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    puts "requeest \n\n\n"
    name =  params[:screen_name]
    tweet = params[:tweet]
    if name == "andremitsuoka"
      puts "request \n\n\n\n\n\n"
      note = Note.new
      note = note.get_note
      #mudar aqui a string
      note.check_todo_in_note("surf surf")
      note.update
    end
    
    render :show
  end

  def show

  end
end
