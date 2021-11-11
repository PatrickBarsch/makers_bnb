require 'availability'

describe Availability do
  describe '.list' do
    it 'saves the availabilities when a new space is listed' do
      from = '2021-11-14'
      to = '2021-12-12'
      space_id = 10
      Availability.list(from, to, space_id)
      availabilities = Availability.when(10)
      expect(availabilities.first).to eq '2021-11-14'
    end
  end
  describe '.when' do
    it 'lists the dates a certain space is available' do
      from = '2021-11-14'
      to = '2021-11-16'
      space_id = 10
      Availability.list(from, to, space_id)
      expect(Availability.when(10)).to eq ['2021-11-14', '2021-11-15', '2021-11-16']
    end
    it 'does not list dates, that are already booked' do
      from = '2021-11-14'
      to = '2021-11-16'
      space_id = 10
      Availability.list(from, to, space_id)
      expect(Availability.when(10)).to eq ['2021-11-14', '2021-11-15', '2021-11-16']
    end
  end
end
