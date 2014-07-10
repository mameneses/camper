class CreateFavorites < ActiveRecord::Migration
  def change
	create_table :favorites do |t|
	  t.belongs_to :campground
	  t.belongs_to :user
	end
  end
end
