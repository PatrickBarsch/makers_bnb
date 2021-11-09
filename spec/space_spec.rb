require 'space'
require_relative './database_helpers'

describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      added = Space.list('MyFancySpace')
      id_added = added.first['id']
      results = persisted_data(id: id_added, table: 'spaces')
      expect(added.first).to eq results
    end
  end
end
