class UsersChallenges < ActiveRecord::Migration

  def change
    create_table :users_challenges,id: false do |t|
      t.belongs_to :user
      t.belongs_to :challenge
    end
  end

end
