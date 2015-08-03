require "rails_helper"

describe Category do
  let(:user) { User.create!(username: "sampleuser", permission_level: "author", password: "password") }
  let(:category) { Category.create!(name: "LARP-ing") }
  let(:article1) { Article.create!(orig_author: user, title: "Swords and What Not") }
  let(:article2) { Article.create!(orig_author: user, title: "How to Choose a Character") }
  let(:version1) { Version.create!(article: article1, updating_author: user, content: "Here is some content") }
  let(:version2) { Version.create!(article: article2, updating_author: user, content: "Here is some content") }
  let(:categorization1) { Categorization.create!(category: category, version: version1) }
  let(:categorization2) { Categorization.create!(category: category, version: version2) }

  describe '#versions' do
    it 'returns an array of versions that are associated with the category' do
      user.save
      category.save
      article1.save
      article2.save
      version1.save
      version2.save
      categorization1.save
      categorization2.save

      expect(category.versions).to eq([version1, version2])
    end
  end
end

# No warning if an admin doesn't footnote
# /categories/dogs
# /articles/the-attack-on-pearl-harbor
# white of a mustache and green of a corn field
