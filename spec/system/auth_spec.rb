describe "The signin - signout process" do
  before { FactoryBot.create(:user, email: "user@example.com") }

  it "Logs in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "Doesn't log in with invalid data" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'user@e.com'
      fill_in 'Password', with: '1234567'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it "Logs out" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_link "Log Out"
    click_link 'Log Out'
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
