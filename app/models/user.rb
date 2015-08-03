class User < ActiveRecord::Base
  has_many :articles, foreign_key: :orig_author_id
  has_many :versions, foreign_key: :updating_author_id

  has_secure_password
  validates :password, length: {minimum: 6}
end
