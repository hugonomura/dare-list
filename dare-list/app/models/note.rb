require "evernote_oauth"

class Note
  attr_accessor :content_body, :challenges

  def initialize
    @title = "Hackathon Taça"

    @start_body = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>'
    @content_body = ''
    @end_body = '</en-note>'
    @body = @start_body + @content_body + @end_body

    @challenges = []

    @parent_notebook = Notebook.new
  end

  def save
    note = Evernote::EDAM::Type::Note.new
    note.title = @title
    @body = @start_body + @content_body + @end_body

    for challenge in challenges
      @content_body += '<en-todo checked="false"/><b>' + challenge.name + '</b> - ' + challenge.description + '<br />' 
    end

    note.notebookGuid = @parent_notebook.guid

    note_ok = DareList::Application.note_store.createNote(note)
  end

end
