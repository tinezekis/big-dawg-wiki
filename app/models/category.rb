class Category < ActiveRecord::Base

  validates :name, uniqueness: true

  after_create :set_slug

  has_many :categorizations
  has_many :versions, through: :categorizations
#Not working... refactor
  # has_many :current_versions, -> {where(is_published: true)}, class_name: "Version"

  def set_slug
    self.slug = self.name.downcase.split.join("-") + "-" + self.id.to_s
    self.save
  end


  def to_params
    self.slug
  end

  def self.match_id(slug)
    id_matcher = /\-([0-9]+)\z/
    match_group = slug.match(id_matcher)
    found_id = match_group[1].to_i
  end
end
