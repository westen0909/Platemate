class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :user_id, presence: true 
	has_attached_file :image, styles: { medium: "640x640#", small: "320x320#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
