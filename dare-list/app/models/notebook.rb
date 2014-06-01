require "evernote_oauth"

class Notebook
  attr_reader :guid

  def initialize
    @name = "Dare List"
    unless exists?
      notebook = Evernote::EDAM::Type::Notebook.new
      notebook.name = @name

      notebook_ok = DareList::Application.note_store.createNotebook(notebook)
      @guid = notebook_ok.guid
    end
  end

  def exists?
    notebooks = DareList::Application.note_store.listNotebooks()
    for notebook in notebooks
      if @name == notebook.name
        @guid = notebook.guid
        return true
      end
    end
    return false
  end
end
