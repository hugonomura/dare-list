class UsersChallenge < ActiveRecord::Base

  belongs_to :challenge
  belongs_to :user

end
