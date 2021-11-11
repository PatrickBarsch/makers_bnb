feature 'Spaces' do

  scenario 'See the list of spaces' do
    setup_test_database
    add_space('Space 1', 'Description 1', 80)
    visit('/spaces')
    expect(page).to have_content ('Space 1')
  end 

  scenario 'Add a space' do
    setup_test_database
    visit('/spaces/new')
    fill_in :name, with: 'Cottage'
    fill_in :description, with: 'A lovely remote cottage'
    fill_in :price_per_night, with: 80
    fill_in :date_from, with: '2021-11-09'
    fill_in :date_to, with: '2021-11-11'
    click_button('List my Space')
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content('Cottage')
  end 
end 
