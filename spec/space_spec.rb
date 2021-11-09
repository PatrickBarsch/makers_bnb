require 'space'

describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      added = Space.list('MyFancySpace')
      connection = PG.connect(dbname: 'makers_bnb_test')
      results = connection.exec("SELECT * FROM spaces")
      expect(added.first).to eq results.first
    end
  end
end