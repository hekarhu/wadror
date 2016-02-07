class Beer < ActiveRecord::Base
include RatingAverage
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
validates_presence_of :name



def to_s
 "#{self.name}, #{brewery.name}"

end

end
