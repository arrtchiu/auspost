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

    it 'returns an empty array with an invalid query' do
      Auspost::API.stub(:get_json).and_return(SAMPLE_POSTCODE_RESPONSE_NO_RESULTS)
      results = Auspost::Locality.search 'wrong-not-valid'
      results.should eq []
    end
  end

  describe :initialization do
    # some sample data to test attributes
    let(:locality_info) {
      {
        'id' => 123,
        'category' => 'some_category',
        'latitude' => 123.456,
        'longitude' => 987.654,
        'location' => 'some_location',
        'postcode' => 9999,
        'state' => 'WA'
      }
    }

    subject { Auspost::Locality.new(locality_info) }
    its(:identifier) { should eq 123 }
    its(:category) { should eq 'some_category' }
    its(:latitude) { should eq 123.456 }
    its(:longitude) { should eq 987.654 }
    its(:location) { should eq 'some_location' }
    its(:postcode) { should eq 9999 }
    its(:state) { should eq 'WA' }
  end
end
