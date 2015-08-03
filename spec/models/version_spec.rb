require "rails_helper"

describe Version do
  let(:user) { User.create!(username: "sampleuser", permission_level: "Author", password: "password") }
  let(:admin) { User.create!(username: "sampleadmin", permission_level: "Big Dawg", password: "password") }
  let(:article) { Article.create!(orig_author: user, title: "When Awesome Groups Make Awesome Apps") }
  let(:version) { Version.create!(article: article, updating_author: admin) }

  describe 'when initialized' do
    it 'has an article associated with it' do
      expect(version.article).to eq(article)
    end

    it 'has an original author (through the article)' do
      expect(version.article.orig_author).to eq(user)
    end

    it 'has an updating_author' do
      expect(version.updating_author).to eq(admin)
    end

    it 'is not the most recent version' do
      expect(version.is_most_recent).not_to be true
    end

    it 'is not published' do
      expect(version.is_published).not_to be true
    end
  end

  xdescribe '#get_ten_longest' do
    # Make a list of at least 11 versions, two of which are from the same article
    xit 'returns an array with ten versions' do
      expect(longest_articles.length).to be 10
      expect(longest_articles[0]).to_be_instance_of(Version)
    end

    xit 'returns versions of ten different articles' do
      # Write a test to prove that the articles are unique in the array
    end
  end

  describe 'new versions of the same article' do
    let(:update) { Version.create!(article: article, updating_author: admin) }

    xit 'gets marked as the most recent version' do
      expect(update.is_most_recent).to be true
    end

    xit 'marks all other versions as NOT the most recent' do
      expect(version.is_most_recent).to be false
    end
  end
end