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


  def self.parse_categories_from_string(string_of_categories)
    #output: array of category items to associate with a given version
    array_of_category_names = string_of_categories.split(',')

    array_of_category_names.map do |category_name|
      Category.find_or_create_by(name: category_name.strip.downcase)
    end
  end

def self.alphabetical_list
  Category.order(:name)
end

def most_recent_associated_versions
  most_recent_versions = self.versions.where(is_most_recent: true)
end



end
