feature 'Spaces' do
  scenario 'See the list of spaces' do
    setup_test_database
    add_row_to_test_database
    visit('/spaces')
    expect(page).to have_content ('Space 1')
  end 

  scenario 'Add a space' do
    setup_test_database
    visit('/spaces/new')
    fill_in :title, with: 'Cottage'
    fill_in :description, with: 'A lovely remote cottage'
    fill_in :price, with: '80'
    fill_in :from_date, with: (24/11/2021)
    fill_in :to_date, with: (25/11/2021)
    click_button('List my Space')
    expect(page). to have_content'Cottage'
  end 
end 

