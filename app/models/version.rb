class Version < ActiveRecord::Base
  attr_reader :sections

  after_create :generate_markdown

  belongs_to :article
  # No user model yet...
  belongs_to :updating_author, class_name: :"User"
  has_many :categorizations
  has_many :categories, through: :categorizations

  def generate_markdown
    @sections = self.get_sections
    @markdown_content = self.get_newlines
    @markdown_content
  end

  def get_sections
    @markdown_content = self.content
    @sections = []
    new_section_data = @markdown_content.match(/#.+\n/)
    section_number = 0
    while new_section_data
      title = new_section_data.to_s
      title[0] = ''
      @sections.push(title)
      start_index = @markdown_content.index(/#.+\n/)
      title_length = new_section_data.to_s.length
      end_index = start_index + title_length - 1
      @markdown_content[end_index] = "</h3>"
      @markdown_content[start_index] = "<h3 class=\"section\" id=\"#{section_number}\">"
      section_number += 1
      new_section_data = @markdown_content.match(/#.+\n/)
    end
    @sections
  end

  def get_newlines
    @markdown_content = @markdown_content.gsub(/\n/, "<br><br>")
  end


end
