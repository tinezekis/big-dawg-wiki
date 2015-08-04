describe "the signin process", :type => :feature do
  before :each do
    User.make(:username => 'Bob', :password => 'password')
  end

  it "signs me in" do
    visit '/login'
    within("#session") do
      fill_in 'Username', :with => 'Bob'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Success'
  end
end
