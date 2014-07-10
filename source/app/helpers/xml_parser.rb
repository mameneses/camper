
require 'nokogiri'
require 'active_support/core_ext/hash'
require 'json'
require 'httparty'
require 'pp'

helpers do

  def xml_parser(url)

    xml = HTTParty.get(url)

    results = Hash.from_xml(xml.body).to_json

    hash = JSON.parse(results)

    campgrounds = hash["resultset"]["result"]

    return campgrounds
  end



end