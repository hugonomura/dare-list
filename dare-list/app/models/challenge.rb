class Challenge < ActiveRecord::Base

  #attr_accessible :name,:type,:description,:date

  has_many :users , through: :users_challenges
  has_many :users_challenges

end
