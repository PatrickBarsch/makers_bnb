feature 'Sign up page' do
  scenario 'A user can sign up into BnB' do
    visit('/')
    fill_in('email_new_user', with: 'user@gmail.com')
    fill_in('passw_new_user_first', with: 'Password123')
    fill_in('pass_new_user_second', with: 'Password123')
    click_button('Submit')

    expect(page).to have_content('Log in to MakersBnB')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
end
