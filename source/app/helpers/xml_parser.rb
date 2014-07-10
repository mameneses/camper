
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

  def campground_exists?(campground)
    Campground.find_by_park_num(campground["facilityID"]) !=nil
  end

  def store_campgrounds (campgrounds)
    @park_ids = []
    campgrounds.each do |camp|
      @park_ids << camp["facilityID"]
      if campground_exists?(camp["facilityID"]) == false
        camps = Campground.create(
          state: camp["state"],
          name: camp["facilityName"],
          amenity: @site_type, 
          site_type: @amenity,
          water_front: camp["sitesWithWaterfront"],
          contract_code: camp["contractID"],
          park_num: camp["facilityID"],
          pic_url: camp["faciltyPhoto"]
          )
        if camp["sitesWithPetsAllowed"] == "Y"
          camps.update_attributes(pets: true)
        end
      end
    end
    @park_ids
  end

end