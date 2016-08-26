class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :user_id, presence: true 
	validates :title, presence: true 
	validates :price, presence: true 
	validates :location, presence: true 
	validates :review,  length: { minimum: 0, maximum: 300 }  
	validates :image, presence: true
	has_attached_file :image, styles: { medium: "640x640#", small: "320x320#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

