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
    fill_in :price, with: 80
    fill_in :date_from, with: '2021-11-09'
    fill_in :date_to, with: '2021-11-11'
    click_button('List my Space')
    expect(page).to have_content 'Cottage'
    expect(page).to have_current_path('/spaces')
  end 
end 
