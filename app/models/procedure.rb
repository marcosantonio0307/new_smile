class Procedure < ApplicationRecord
	has_one_attached :avatar, dependent: :destroy
	has_many_attached :photos, dependent: :destroy
	has_many_attached :raysx, dependent: :destroy
	has_many_attached :teleraysx, dependent: :destroy
	has_many_attached :traceds, dependent: :destroy
	has_many_attached :usps, dependent: :destroy
	has_many_attached :reports, dependent: :destroy
	has_many :works, dependent: :destroy

	def thumbnail
		return self.photos.variant(resize: '300x300')
	end
end
