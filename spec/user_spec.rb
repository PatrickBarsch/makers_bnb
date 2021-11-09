require 'user'

describe User do
  describe '.sign_up' do
    it 'creates a new User with Username in the database' do
      user = User.sign_up(email: 'test@example.com')
      
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'test@example.com'
    end
  end
end
