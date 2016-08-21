class Post < ApplicationRecord
	has_attached_file :image, styles: { medium: "640x640#", small: "320x320#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
