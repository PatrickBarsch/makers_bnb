feature 'Login page' do
  scenario 'A user can login into BnB' do
    visit('/sessions/new')
    fill_in('email', with: 'user@gmail.com')
    fill_in('password', with: 'Password123')
    click_button('Submit')

    expect(page).to have_content('Sign out')
    expect(page).to have_content('Book a Space')
  end
end
