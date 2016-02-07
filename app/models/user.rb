class User < ActiveRecord::Base
include RatingAverage
has_secure_password

  validates :username, uniqueness: true,
                       length: { minimum: 3,
				 maximum: 15}
  validates :password, length:  {minimum: 4}
  validates_format_of :password, with: /\A.*[^[:alpha:]]+.*\Z/
has_many :ratings

end
