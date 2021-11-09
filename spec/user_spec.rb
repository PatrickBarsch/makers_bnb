require 'user'

describe User do
  describe '.sign_up' do
    it 'creates a new User with Username in the database' do
    added = User.sign_up(username: 'ExampleUser123')
    id_added = added.first['id']
    results = persisted_data(id: id_added, table: 'users')
    expect(added.first).to eq results
    end
  end
end