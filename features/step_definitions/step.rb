Given('I am on the home page') do
  #pending # Write code here that turns the phrase above into concrete actions
  Article.create!()
  visit "/login"
end

Then('I should see {string}') do |string|
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_content(string)
end

Then('I should see the canvas') do 
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_xpath("//div[@class='canvas']")
end

Then('I should see the item menu') do 
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_xpath("//div[@id='editing_page']")
end

Given('I have received the saved data') do
  #pending # Write code here that turns the phrase above into concrete actions
  visit "/articles_json"
  visit "/login"
end

Then('I should see event icons on canvas') do 
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_xpath("//div[@class='sourceItems' and @id='src_copy0']")
end