require "rails_helper"

describe SessionsController do
  let!(:user) { User.create!(username: "Bob", password: "password") }

  describe "GET #new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    context "where valid params are passed" do
      subject { post :create, :sessions => { username: "Bob", password: "password"} }

      it "creates a session[:user_id]" do
        subject
        expect(session[:user_id]).to eq(user.id)
      end

      xit "redirects to the articles index page" do
      end
    end

    context "where invalid params are passed" do
      subject { post :create, :sessions => {username: "Bob", password: ""} }

      it "assigns a a new error as @errors" do
        subject
        expect(assigns(:errors)).to be_truthy
      end

      it "re-renders the 'new' template" do
        subject
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "DESTROY" do
    context "when person hits log out" do
      subject { delete :destroy, sessions: { username: "Bob", password: "password"}}

      it "will make session[:user_id] nil" do
        subject
        expect(session[:user_id]).to eq(nil)
      end
    end
  end
end
