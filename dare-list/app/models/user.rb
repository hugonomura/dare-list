class User < ActiveRecord::Base

#attr_accessible   :name,:email,:date
#attr_protected :twitter_token, :ever_token

has_many :challenges , through: :users_challenges
has_many :users_challenges


#accepts_nested_attributes_for :pets


end
