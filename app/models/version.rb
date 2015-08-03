class Version < ActiveRecord::Base
  belongs_to :article
  # No user model yet...
  belongs_to :updating_author, class_name: :"User"
  has_many :categorizations
  has_many :categories, through: :categorizations
end
