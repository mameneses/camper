helpers do
  def campground_exists?(campground)
    Campground.find_by_park_num(campground["facilityID"]) !=nil
  end

  def store_campgrounds (campgrounds)
    @park_ids = []
    campgrounds.each do |camp|
      p camp["facilityID"]
      @park_ids << camp["facilityID"]
      if campground_exists?(camp["facilityID"]) == false
        camps = Campground.create(
          state: camp["state"],
          name: camp["facilityName"],
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
