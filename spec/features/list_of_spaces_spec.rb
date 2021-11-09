feature 'Spaces' do
  scenario 'See the list of spaces' do
    setup_test_database
    add_row_to_test_database
    visit('/spaces')
    expect(page).to have_content ('Space 1')
  end 
end 
