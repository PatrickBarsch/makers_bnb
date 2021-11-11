feature 'List a space' do
  scenario 'A user can list space using BnB' do
    visit('/spaces/new')
    fill_in('name', with: 'La Cotagge')
    fill_in('description', with: 'Some description')
    fill_in('price_per_night', with: 150)
    fill_in('date_from', with: '10/11/2021')
    fill_in('date_to', with: '20/11/2021')
    click_button('List my Space')

  #   ---- To Be Changed -----
    expect(page).to have_content('Sign out')
    expect(page).to have_content('Book a Space')
    expect(page).to have_content('List a space')
  end
end
