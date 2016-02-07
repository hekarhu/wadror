class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers
  has_many :ratings, through: :beers
validates_presence_of :name
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    less_than_or_equal_to: 2016,
                                    only_integer: true }
end
