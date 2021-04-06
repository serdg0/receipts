describe "the signin process" do
  before :each do
    FactoryBot.create(:user, email: "user@example.com")
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end