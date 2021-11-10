describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      added = Space.list('MyFancySpace', 'A small space', 80, '01/01/2021', '03/01/2021')
      id_added = added.first['id']
      results = persisted_data(id: id_added, table: 'spaces')
      expect(added.first).to eq results
    end
  end
  # describe '.all' do
  #   it 'returns a list of all available spaces'
  # end
  # end
end
