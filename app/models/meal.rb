class Meal < ActiveRecord::Base
	belongs_to :restaurant
    validates  :restaurant_id, presence: true

    has_attached_file :meal_photo, :styles => { :medium => "300x300>", :thumb => "100x100>, :big => 700x700" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :meal_photo, :content_type => /\Aimage\/.*\Z/
end
