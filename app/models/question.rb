class Question < ActiveRecord::Base
 belongs_to :survey
 validates :questiontxt, :length => { :maximum => 250 }, :presence => true
 validates :option1, :length => { :maximum => 250 }, :presence => true
 validates :option2, :length => { :maximum => 250 }, :presence => true
 validates :option3, :length => { :maximum => 250 }, :presence => true
 validates :option4, :length => { :maximum => 250 }, :presence => true
 validates :option5, :length => { :maximum => 250 }, :presence => true
end
