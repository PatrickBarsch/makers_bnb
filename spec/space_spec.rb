describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      space1 = { name: 'MyFancySpace', 
        description: 'A small space', 
        price: 80, 
        date_from: '01/01/2021', 
        date_to:'03/01/2021' }
      added = Space.list(**space1)
      id_added = added.first['id']
      results = persisted_data(id: id_added, table: 'spaces')
      expect(added.first).to eq results
    end
  end
  describe '.all' do
    it 'returns a list of all available spaces' do
      space1 = { name: 'MyFancySpace', 
        description: 'A small space', 
        price: 80, 
        date_from: '01/01/2021', 
        date_to:'03/01/2021' }
      space2 = { name: 'MyEvenFancierSpace', 
        description: 'It is a lot bigger',
        price: 150, 
        date_from: '01/01/2021', 
        date_to:'03/01/2021' }
      space3 = { name: 'MyUltraFancySpace', 
        description: 'I call it minimalistic',
        price: 300,
        date_from: '01/01/2021', 
        date_to:'03/01/2021'}
      
      added = [Space.list(**space1)]
      added << Space.list(**space2)
      added << Space.list(**space3)
      added.map! { |result| result.first }
      space_list = Space.all
      expect(space_list.length).to eq 3
      expect(space_list.first).to be_a Space
      expect(space_list.last.description).to eq('I call it minimalistic')
      expect(space_list.last.price).to eq(300)
    end
  end
end
