class User < ActiveRecord::Base
    validates :firstname, :length => { :maximum => 25 }, :presence => true
    validates :lastname, :length => { :maximum => 25 }, :presence => true
    validates :username, :length => { :maximum => 25, :minimum => 6 }, :presence => true
   validates :password, :length => { :maximum => 12 , :minimum => 6}, :presence => true
   validates_uniqueness_of :username
end
