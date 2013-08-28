require 'rubygems'
require 'bundler/setup'
require 'auspost'

# the json api doesn't nest things in a 'railsy' way
# these samples are built from actual responses.
SAMPLE_POSTCODE_RESPONSE_SINGLE = {
  "localities" => {
    "locality" => {
      "category" => "Delivery Area",
      "id" => 14222,
      "latitude" => -31.873677,
      "location" => "CAVERSHAM",
      "longitude" => 115.977483,
      "postcode" => 6055,
      "state" => "WA"
    }
  }
}
SAMPLE_POSTCODE_RESPONSE_MULTIPLE = {
  "localities" => {
    "locality" => [
      {
        "category" => "Delivery Area",
        "id" => 7348,
        "latitude" => -36.755513000000001,
        "location" => "BENDIGO",
        "longitude" => 144.28426300000001,
        "postcode" => 3550,
        "state" => "VIC"
      },
      {
        "category" => "Delivery Area",
        "id" => 7349,
        "latitude" => -36.755513000000001,
        "location" => "BENDIGO SOUTH",
        "longitude" => 144.28426300000001,
        "postcode" => 3550,
        "state" => "VIC"
      }
    ]
  }
}
SAMPLE_POSTCODE_RESPONSE_NO_RESULTS = {
  "localities" => ""
}
