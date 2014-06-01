require "evernote_oauth"

class Note
  attr_accessor :body

  def initialize
    @title = "Hackathon Taça"
    @body = ""
    @parent_notebook = Notebook.new
  end

  def save
    note = Evernote::EDAM::Type::Note.new
    note.title = @title
    note.content = @body
    note.notebookGuid = @parent_notebook.guid

    note_ok = DareList::Application.note_store.createNote(note)
  end

end
