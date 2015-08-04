class Version < ActiveRecord::Base
  belongs_to :article
  # No user model yet...
  # belongs_to :updating_author, class_name: :"User"
  has_many :categorizations
  has_many :categories, through: :categorizations

  def generate_section_headers
    section_title = self.content.match(/#.+\n/)
    while section_title
      start_index = self.content.rindex(/#.+\n/)
      title_length = section_title.to_s.length
      end_index = start_index + title_length
      self.content[end_index] = "</h3>"
      self.content[start_index] = "<h3>"
    end
  end
end
