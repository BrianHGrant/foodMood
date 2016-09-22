require "rails_helper"

describe "the search by category process" do
  it "will return all foods with the category of sweet", js: true do
    user = FactoryGirl.create(:user)
    login_as(user)
    FactoryGirl.create(:category, name: "sweet")
    FactoryGirl.create(:category, name: "savory")
    FactoryGirl.create(:category, name: "high carb")
    FactoryGirl.create(:type, name: "meal")
    FactoryGirl.create(:type, name: "snack")
    FactoryGirl.create(:type, name: "drink")
    10.times { FactoryGirl.create(:food) }
    visit foods_path
    fill_in "search" , :with => 'savory'
    click_on 'Search'
    sleep 2
    expect page.has_content?("savory")
    expect(page).to have_no_content "sweet"
  end
end

describe "the sort by type process" do
  it "will sort food data by type column", js: true do
    user = FactoryGirl.create(:user)
    login_as(user)
    FactoryGirl.create(:category, name: "sweet")
    FactoryGirl.create(:category, name: "savory")
    FactoryGirl.create(:category, name: "high carb")
    FactoryGirl.create(:type, name: "meal")
    FactoryGirl.create(:type, name: "snack")
    FactoryGirl.create(:type, name: "drink")
    10.times { FactoryGirl.create(:food) }
    visit foods_path
    click_on "Type of Meal"
    sleep 2
    save_and_open_screenshot
    expect(page.find('tr:nth-child(1)')).to have_content "Meal"
  end
end
