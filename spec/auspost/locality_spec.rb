require 'spec_helper'

describe Auspost::Locality do
  describe :search do
    it 'returns an array of localities for a valid query returning multiple results' do
      Auspost::API.stub(:get_json).and_return(SAMPLE_POSTCODE_RESPONSE_MULTIPLE)
      results = Auspost::Locality.search '6055'
      results.should be_a Array
      results.first.should be_a Auspost::Locality
    end

    it 'returns an array of localities for a valid query returning a single result' do
      Auspost::API.stub(:get_json).and_return(SAMPLE_POSTCODE_RESPONSE_SINGLE)
      results = Auspost::Locality.search '6055'
      results.should be_a Array
      results.first.should be_a Auspost::Locality
    end

    it 'should return an empty array with an invalid query' do
      Auspost::API.stub(:get_json).and_return(SAMPLE_POSTCODE_RESPONSE_NO_RESULTS)
      results = Auspost::Locality.search 'wrong-not-valid'
      results.should eq []
    end
  end
end
