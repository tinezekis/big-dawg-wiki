require "rails_helper"

describe Category do
  let(:user) { User.create!(username: "sampleuser", permission_level: "author", password: "password") }
  let(:category) { Category.create!(name: "LARP-ing") }
  let(:article1) { Article.create!(orig_author: :user, title: "Swords and What Not") }
  let(:article2) { Article.create!(orig_author: :user, title: "How to Choose a Character") }
  let(:categorization1) { Categorization.create!() }

  describe '#articles' do
    it 'returns an array of articles that are associated with the category' do
      expect(category.articles).to eq([article1, article2])
    end
  end
end

# No warning if an admin doesn't footnote
# /categories/dogs
# /articles/the-attack-on-pearl-harbor
# white of a mustache and green of a corn field
