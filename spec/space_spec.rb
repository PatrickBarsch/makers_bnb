describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      added = Space.list('MyFancySpace', 'A small space', 80, '01/01/2021', '03/01/2021')
      id_added = added.first['id']
      results = persisted_data(id: id_added, table: 'spaces')
      expect(added.first).to eq results
    end
  end
  describe '.all' do
    it 'returns a list of all available spaces' do
      added = [Space.list('MyFancySpace', 'A small space', 80, '01/01/2021', '03/01/2021')]
      added << Space.list('MyEvenFancierSpace', 'It is a lot bigger', 150, '01/01/2021', '03/01/2021')
      added << Space.list('MyUltraFancySpace', 'I call it minimalistic', 300, '01/01/2021', '03/01/2021')
      added.map! { |result| result.first }
      space_list = Space.all
      expect(space_list.length).to eq 3
      expect(space_list.first).to be_a Space
      expect(space_list.last.description).to eq('I call it minimalistic')
      expect(space_list.last.price).to eq(300)
    end
  end
end
