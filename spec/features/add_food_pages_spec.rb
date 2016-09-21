require 'rails_helper'

describe "the add a food path" do
  it "will allow a user to add a food" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:category)
    FactoryGirl.create(:type)
    login_as(user)
    visit '/'
    click_link 'Log New'
    select 'sweet'
    select 'meal'
    select '2016'
    select 'August'
    select('21', :from => 'food_time_consumed_3i')
    select('14', :from => 'food_time_consumed_4i')
    select('29', :from => 'food_time_consumed_5i')
    click_on 'Create Food'
    expect(page).to have_content('Food saved successfully')
  end
end
