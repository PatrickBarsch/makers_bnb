feature 'Spaces' do
  scenario 'See the list of spaces' do
    connection = PG.connect(dbname: 'makers_bnb_test')
    connection.exec("INSERT INTO spaces (name) VALUES ('Space 1);")
    visit('/spaces')
    expect(page).to have_content 'Space 1'
  end 
end 
