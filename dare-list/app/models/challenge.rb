class Challenge < ActiveRecord::Base
  attr_accessible :name,:type,:description,:date

  has_and_belongs_to_many :users

end
