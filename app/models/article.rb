class Article < ActiveRecord::Base
  has_many :versions
  # no user model yet....
  # belongs_to :orig_author, class_name: :"User"
  has_many :categorizations, through: :versions
  has_many :categories, through: :categorizations
end
