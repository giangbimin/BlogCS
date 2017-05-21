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

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
