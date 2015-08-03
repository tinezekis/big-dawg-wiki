require "rails_helper"

describe Article do
  let(:user) { User.new(username: "sampleuser", permission_level: "author", password: "password") }
  let(:article) { Article.new(orig_author: :user, title: "When Awesome Groups Make Awesome Apps") }

  describe '#orig_author' do
    it 'must have an original author' do
      expect(article.orig_author).not_to be nil
    end

    it 'has a user as its original author' do
      expect(article.orig_author).to_be_instance_of(User)
    end

    it 'returns the user who authored the article' do
      expect(article.orig_author).to eq(:user)
    end
  end

  describe '#title' do
    it 'must have a title' do
      expect(article.title).not_to be nil
    end

    it 'returns the title of the article' do
      expect(article.title).to eq("When Awesome Groups Make Awesome Apps")
    end
  end
end