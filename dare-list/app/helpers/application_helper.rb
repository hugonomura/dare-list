module ApplicationHelper
  def create_todo_list(user)
    note = Note.new
    for challenge in user.challenges
      note.add_challenge(challenge, 'false')
    end
    note.save_new_todo
  end
end
