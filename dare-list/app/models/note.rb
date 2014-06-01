require "evernote_oauth"

class Note
  attr_accessor :content_body

  def initialize
    @title = "Hackathon Taça"

    @start_body = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>'
    @content_body = ''
    @end_body = '</en-note>'
    @body = @start_body + @content_body + @end_body

    @challenges = []

    @parent_notebook = Notebook.new
  end

  # passar 'true' ou 'false' como checked
  def add_challenge(challenge, checked)
    @challenges << '<en-todo checked="' + checked + '"/><b>' + challenge.name + '</b> - ' + challenge.description + '<br />' 
  end

  def save_new_todo
    note = Evernote::EDAM::Type::Note.new
    note.title = @title

    for challenge in challenges
      @content_body += challenge
    end

    @body = @start_body + @content_body + @end_body

    note.content = @body
    note.notebookGuid = @parent_notebook.guid

    note_ok = DareList::Application.note_store.createNote(note)
  end

  def check_todo_in_note(name)
    for challenge in challenges
      if challenge.name == name
        challenge.sub("\"false\"", "\"true\"")
      end
    end
  end

  def read_challenges(content)
    matchs = /(<en-todo checked=\"(false|true)\"\/>)(.*)(<br \/>)/.match(content)
    for match in matchs
      m = match.to_a
      add_challenge(m[3], m[1])
    end
  end

  def get_note
    note_store = DareList::Application.note_store
    note_filter = Evernote::EDAM::NoteStore::NoteFilter.new
    note_filter.notebookGuid = Notebook.new.guid
    note_filter.words = "\"Hackathon Taça\""
    notes_metadata_result_spec = Evernote::EDAM::NoteStore::NotesMetadataResultSpec.new
    notes = note_store.findNotesMetadata(note_filter, 0, 100, notes_metadata_result_spec)
    note = notes.notes[0]
    note = note_store.getNote(note.guid, true, false, false, false)
    read_challenges(note.content)
  end

end
