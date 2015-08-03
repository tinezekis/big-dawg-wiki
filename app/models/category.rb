class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :versions, through: :categorizations
  #Not working... refactor
  # has_many :current_versions, -> {where(is_published: true)}, class_name: "Version"
end
