module ApplicationHelper
  def create_todo_list(user)
    note = Note.new
    for challenge in user.challenges
      note.challenges << challenge
    end
    note.save
  end
end
