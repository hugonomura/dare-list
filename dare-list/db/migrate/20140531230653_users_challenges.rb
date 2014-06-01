class UsersChallenges < ActiveRecord::Migration

  def change
    create_table :users_challenges do |t|
      t.belongs_to :user
      t.belongs_to :challenge
      t.boolean :concluded
      t.date :date
    end

  end

end
