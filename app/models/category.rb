class Category < ActiveRecord::Base

  after_create :set_slug

  has_many :categorizations
  has_many :versions, through: :categorizations
#Not working... refactor
  # has_many :current_versions, -> {where(is_published: true)}, class_name: "Version"

  def set_slug
    self.slug = self.name.downcase.split.join("-") + "-" + self.id.to_s
  end


  def to_params
    self.slug
  end



end
