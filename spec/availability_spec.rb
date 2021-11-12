require 'availability'

describe Availability do
  describe '.list' do
    it 'saves the availabilities when a new space is listed' do
      from = '2021-11-14'
      to = '2021-12-12'
      space_id = 10
      Availability.list(from, to, space_id)
      availabilities = Availability.when(10)
      expect(availabilities.first.date).to eq '2021-11-14'
    end
  end
  describe '.when' do
    it 'lists the dates a certain space is available' do
      from = '2021-11-14'
      to = '2021-11-16'
      space_id = 10
      Availability.list(from, to, space_id)
      availabilities = Availability.when(10)
      expect(availabilities[1].date).to eq '2021-11-15'
    end
    it 'does not list dates, that are already booked' do
      from = '2021-11-14'
      to = '2021-11-16'
      space_id = 10
      Availability.list(from, to, space_id)
      availabilities = Availability.when(10)
      expect(availabilities.first).to be_a Availability 
      expect(availabilities.first.date).to eq '2021-11-14'
      expect(availabilities.last.date).to eq '2021-11-16'
    end
  end
  describe 'retreive_by_id' do 
    it 'creates an availability object corresponding to a database entry' do 
      from = '2021-11-14'
      to = '2021-11-16'
      space_id = 10
      Availability.list(from, to, space_id)
      availabilities = Availability.when(10)
      retreived = Availability.retreive_by_id(id: availabilities.first.id)
      expect(retreived.id).to eq availabilities.first.id
      expect(retreived.date).to eq availabilities.first.date
    end
  end
end
