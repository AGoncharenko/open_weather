When(/^I visit home page$/) do
    visit("/")
end

Then(/^I see weather for random city$/) do
  expect(find("table tr:first-of-type td:nth-child(2)")).not_to be_nil
end

When(/^I enter "(.*?)" into "(.*?)" text_field$/) do |city, city_input|
  fill_in city_input, with: city
end

When(/^I select "(.*?)" in "(.*?)" selectbox$/) do |country, country_input|
  select country, :from => country_input
end

And(/^I submit form$/) do
  click_button "submit"
end

When(/^I wait "(.*?)" seconds$/) do |time|
  sleep time.to_i
end


Then(/^Warning message is shown with "(.*?)" in "(.*?)" suggestion$/) do |city, country|
  expect(page).to have_content("Did you mean #{city} in #{country}")
end

Then(/^I should see weather for "(.*?)" city$/) do |city|
  expect(find("table tr:first-of-type td:nth-child(2)")).to have_content(city)
end
