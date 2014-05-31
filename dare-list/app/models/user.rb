class User < ActiveRecord::Base

attr_accessible   :name,:email,:date
attr_protected :twitter_token, :ever_token

has_and_belongs_to_many :challenges

end
