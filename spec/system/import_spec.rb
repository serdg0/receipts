describe "Importing a tabs document" do

  it "when attaching an .xlsx" do
    FactoryBot.create(:user, email: "tabs@example.com")
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'tabs@example.com'
      fill_in 'Password', with: '123456'
    end
    
    click_button 'Log in'
    attach_file 'receipts', "#{Rails.root}/app/assets/files/example.tab.xlsx"
    click_button "Save"
    expect(page).to have_content 'Total Income: $95.0'
  end

  it "when attaching an .ods" do
    FactoryBot.create(:user, email: "tabs@example.com")
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'tabs@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    attach_file 'receipts', "#{Rails.root}/app/assets/files/example.tab.ods"
    click_button "Save"
    expect(page).to have_content 'Total Income: $95.0'
  end

  it "when attaching an .csv" do
    FactoryBot.create(:user, email: "tabs@example.com")
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'tabs@example.com'
      fill_in 'Password', with: '123456'
    end
    
    click_button 'Log in'
    attach_file 'receipts', "#{Rails.root}/app/assets/files/example.tab - example.tab.csv"
    click_button "Save"
    expect(page).to have_content 'Total Income: $95.0'
  end
end
