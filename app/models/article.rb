class Article < ActiveRecord::Base

  after_create :set_slug

  has_many :versions
  # no user model yet....
  belongs_to :orig_author, class_name: :"User"
  has_many :categorizations, through: :versions
  has_many :categories, through: :categorizations

  def to_param
    self.slug
  end

  def set_slug
    self.slug = self.title.downcase.split.join("-") + "-" + self.id.to_s
  end

end
