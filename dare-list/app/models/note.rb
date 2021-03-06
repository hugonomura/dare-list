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
    @challenges << '<en-todo checked="' + checked + '"/>' + challenge.name + '' + challenge.description + '<br />' 
  end

  def save_new_todo
    note = Evernote::EDAM::Type::Note.new
    note.title = @title

    for challenge in @challenges
      @content_body += challenge
    end

    @body = @start_body + @content_body + @end_body

    note.content = @body
    note.notebookGuid = @parent_notebook.guid

    note_ok = DareList::Application.note_store.createNote(note)
  end

  def check_todo_in_note(name)
    for challenge in @challenges
      # TODO: mudar essa regex
      m = /<en-todo checked="false"\/><b>(.*)<\/b>/.match(challenge)
      if m and m[1] == name
        challenge.sub("\"false\"", "\"true\"")
      end
    end
  end

  def read_challenges(content)
    matchs = content.scan(/(<en-todo checked=\"(false|true)\"\/>)(.*)(<br \/>)/)
    for match in matchs
      m = match.to_a
      c = Challenge.new
      c.name = m[2]
      c.description = ''
      add_challenge(c, m[1])
    end
  end

  def update
    note_store = DareList::Application.note_store
    note_filter = Evernote::EDAM::NoteStore::NoteFilter.new
    note_filter.notebookGuid = Notebook.new.guid
    note_filter.words = '"Hackathon Taça"'
    notes_metadata_result_spec = Evernote::EDAM::NoteStore::NotesMetadataResultSpec.new
    notes = note_store.findNotesMetadata(note_filter, 0, 100, notes_metadata_result_spec)
    note = notes.notes[0]
    note = note_store.getNote(note.guid, true, false, false, false)

    note.content = @start_body
    for challenge in @challenges
      note.content += challenge
    end
    note.content += @end_body
    note_store.updateNote(note)
  end

  def get_note
    note_store = DareList::Application.note_store
    note_filter = Evernote::EDAM::NoteStore::NoteFilter.new
    note_filter.notebookGuid = Notebook.new.guid
    note_filter.words = '"Hackathon Taça"'
    notes_metadata_result_spec = Evernote::EDAM::NoteStore::NotesMetadataResultSpec.new
    notes = note_store.findNotesMetadata(note_filter, 0, 100, notes_metadata_result_spec)
    note = notes.notes.last
    note = note_store.getNote(note.guid, true, false, false, false)
    read_challenges(note.content)
  end

end
