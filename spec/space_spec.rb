describe Space do
  describe '.list' do 
    it 'adds a space to the list of spaces' do
      space1 = { name: 'MyFancySpace', 
        description: 'A small space', 
        price_per_night: 80,
        owner_id: 1  }
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
        price_per_night: 80,
        owner_id: 1 }
      space2 = { name: 'MyEvenFancierSpace', 
        description: 'It is a lot bigger',
        price_per_night: 150,
        owner_id: 2  }
      space3 = { name: 'MyUltraFancySpace', 
        description: 'I call it minimalistic',
        price_per_night: 300,
        owner_id: 3 }
      
      added = [Space.list(**space1)]
      added << Space.list(**space2)
      added << Space.list(**space3)
      added.map! { |result| result.first }
      space_list = Space.all
      expect(space_list.length).to eq 3
      expect(space_list.first).to be_a Space
      expect(space_list.last.description).to eq('I call it minimalistic')
      expect(space_list.last.price_per_night).to eq(300)
    end
  end
end
