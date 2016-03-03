class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true

	validates :title, uniqueness: true

	validates :price, numericality: {greater_than_or_equal_to: 0.01}

	validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
	}
    validates :title, length: { maximum: 30, minimum: 3}

    validates_length_of :description, within: 80..255, too_long: 'это поле не должно превышать 255 символов', too_short: 'это поле не должно быть менее 80 символов'

    def self.latest
      Product.order(:updated_at).last
    end
end
