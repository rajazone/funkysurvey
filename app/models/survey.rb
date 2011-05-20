class Survey < ActiveRecord::Base
  has_many :questions,
   :dependent => :destroy
    validates :surveyname, :length => { :maximum => 140 }, :presence => true
end
