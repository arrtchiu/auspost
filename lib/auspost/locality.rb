module Auspost
  class Locality
    attr_reader :identifier, :category, :latitude, :longitude, :location, :postcode, :state

    # Searches for localities by suburb, town, city, or postcode.
    # Returns an array of `Locality` objects.
    # 
    def self.search(query, state = nil, exclude_postbox = false)
      perform_search(query, state, exclude_postbox).map do |locality_info|
        self.new locality_info
      end
    end

    def initialize(locality_info)
      @identifier = locality_info['id']
      %w[ category latitude longitude location postcode state ].each do |attribute|
        instance_variable_set("@#{attribute}".to_sym, locality_info[attribute])
      end
    end

    private

    def self.perform_search(query, state = nil, exclude_postbox = false)
      params = {
        q: query,
        excludePostBoxFlag: exclude_postbox
      }
      params.merge!({ state: state }) if state
      result = API.get_json '/api/postcode/search.json', params
      [result['localities']['locality']].flatten.reject{|x|!x}
    end
  end
end
