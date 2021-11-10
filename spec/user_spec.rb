require 'user'

describe User do
  describe '.sign_up' do
    it 'creates a new User with Username in the database' do
      user = User.sign_up(email: 'test@example.com', password: 'notSecurePassword')
      
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'test@example.com'
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.sign_up(email: 'test@example.com', password: 'password123')
    end
  end
end
