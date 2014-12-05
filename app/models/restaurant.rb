class Restaurant < ActiveRecord::Base
	has_many :meals
	has_many :locations
	accepts_nested_attributes_for :locations

	 has_attached_file :restaurant_logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	 validates_attachment_content_type :restaurant_logo, :content_type => /\Aimage\/.*\Z/
end
