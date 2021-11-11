require 'availability'

describe Availability do
  describe '.list' do
    it 'saves the availabilities when a new space is listed' do
      from = '2021-11-14'
      to = '2021-12-12'
      space_id = 10
      Availability.list(from, to, space_id)
      first_availability = persisted_data(id: 1, table: 'availabilities')
      expect(first_availability['date']).to eq '2021-11-14'
    end
  end
end
