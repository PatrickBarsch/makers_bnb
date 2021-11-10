require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    after(:all) do
      ENV['ENVIRONMENT'] = 'test'
    end
    it 'connects to makers_bnb, when we do NOT run tests' do
      ENV['ENVIRONMENT'] = 'not_test'
      expect(PG).to receive(:connect).with(dbname: 'makers_bnb')
      DatabaseConnection.setup
    end
  end
end