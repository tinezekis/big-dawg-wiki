require "rails_helper"

describe UsersController do
  let!(:user) { User.create!(username: "Bob", password: "password") }

  describe "GET #new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    context "where valid params are passed" do
      subject { post :create, :user => { username: "Ben", password: "helloo"} }

      it "creates a new User" do
        expect{subject}.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        subject
        expect(assigns(:user)).to eq(User.last)
      end

      xit "redirects to the articles index page" do
      end
    end

    context "where invalid params are passed" do
      subject { post :create, :user => {username: "Christine", password: ""} }

      it "assigns a newly created but unsaved user as @user" do
        expect{subject}.to_not change(User, :count)
        expect(assigns(:user)).not_to eq(User.last)
      end

      it "re-renders the 'new' template" do
        expect(subject).to render_template(:new)
      end
    end
  end
end
