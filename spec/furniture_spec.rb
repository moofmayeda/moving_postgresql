require 'pg'
require 'rspec'
require 'furniture'

DB = PG.connect({:dbname => 'moving_test'})
ATTRIBUTES = {'description' => 'moof desk', 'difficulty' => 6}

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM furniture *;")
  end
end

describe "Furniture" do
  describe "initialize" do
    it "initializes a piece of furniture with a hash" do
      test_furniture = Furniture.new(ATTRIBUTES)
      expect(test_furniture).to be_a Furniture
    end
  end

  describe "save" do
    it "saves a piece of furniture to the database" do
      test_furniture = Furniture.new(ATTRIBUTES)
      test_furniture.save
      expect(test_furniture.all).to eq [test_furniture]
    end
  end
end
