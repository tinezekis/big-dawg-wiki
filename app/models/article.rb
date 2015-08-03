class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :versions
  # no user model yet....
  belongs_to :orig_author, class_name: :"User"
  has_many :categorizations, through: :versions
  has_many :categories, through: :categorizations
end
