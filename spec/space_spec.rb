describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      added = Space.list('MyFancySpace', 'A small space', 80, 01/01/2021, 03/01/2021)
      connection = PG.connect(dbname: 'makers_bnb_test')
      results = connection.exec("SELECT * FROM spaces")
      expect(added.first).to eq results.first
    end
  end
end
