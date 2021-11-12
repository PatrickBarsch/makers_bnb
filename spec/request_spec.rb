require 'request'

describe Request do
  describe '.create' do 
    it 'creates a new request, when a users wants to book a space' do 
      availability_id = 10
      requestor_id = 3
      new_request = Request.create(availability_id, requestor_id)
      entered_request = persisted_data(id: new_request.first['id'], table: 'requests')
      expect(new_request.first).to eq entered_request
    end
  end
end