require 'spec_helper'

describe "Layout Links" do
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template('pages/contact')
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should render_template('pages/about')
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should render_template('pages/help')
  end
  
  it "should have a signup page at '/signup'" do
    get 'signup'
    response.should render_template('users/new')
  end
  
  # Webrat test
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should render_template('pages/about')
    click_link "Help"
    response.should render_template('pages/help')
    click_link "Contact"
    response.should render_template('pages/contact')
    click_link "Home"
    response.should render_template('pages/home')
    click_link "Sign up now!"
    response.should render_template('users/new')
  end
  
  describe "when not signed in" do

    it "should have a sign in link" do
      visit root_path
      response.should have_selector("a", :href => signin_path, :content => "Sign in")
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a sign out link" do
      visit root_path
      response.should have_selector("a", :href => signout_path, :content => "Sign out")
    end
    
    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user), :content => "Profile")
    end
  end
end
