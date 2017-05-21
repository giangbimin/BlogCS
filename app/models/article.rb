# Article model
class Article < ApplicationRecord
  extend FriendlyId

  include PgSearch

  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader

  pg_search_scope :search_for, against: { title: 'A', description: 'B', body: 'C' },
    using: {
        tsearch: {
          prefix: true,
          any_word: true
        }
    }

  validates_processing_of :image
  validate :image_size_validation

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

private

  def image_size_validation
    errors[:image] << 'should be less than 10 mb' if image.size > 10.megabytes
  end
end
