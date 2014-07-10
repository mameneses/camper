class CreateCampgrounds < ActiveRecord::Migration
  def change
  	create_table :campgrounds do |t|
  		t.string :state
  		t.string :name
  		t.string :site_type
  		t.string :amenity
  		t.boolean :pets, default: false
  		t.string :water_front
      t.string :contract_code
      t.string :park_num
      t.string :pic_url
  	end
  end
end
