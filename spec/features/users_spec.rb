describe "the signup process", :type => :feature do
  before :each do
    User.make(:username => 'Bob', :password => 'password')
  end

  it "signs me up" do
    visit '/signup'
    fill_in 'Username', :with => 'Bob'
    fill_in 'Password', :with => 'password'

    click_button 'Create User'
    expect(page).to have_content 'Success'
  end
end
