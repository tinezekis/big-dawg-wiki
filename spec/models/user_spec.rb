require "rails_helper"

describe User do
  let(:user) { User.new(username: "sampleuser", permission_level: "author", password: "password") }

  describe 'attributes' do
    it "should have a username" do
      expect(user.username).to eq("sampleuser")
    end

    it "should have the default permission_level" do
      expect(user.permission_level).to eq("author")
    end

    it "should have a password" do
      expect(user.password).to be_truthy
    end

    it "should not have a password longer than 6 characters" do
      bad_user = User.new(username: "bob", password:"")
      expect(bad_user.valid?).to be false
    end

    it "should have a password with at least 6 characters" do
      expect(user.valid?).to be true
    end
  end
end
