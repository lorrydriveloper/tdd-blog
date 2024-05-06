class Page < ApplicationRecord
  before_validation :generate_slug

  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :slug, uniqueness: true, presence: true

  scope :published, -> { where(published: true) }
  scope :ordered, -> { order(created_at: :desc) }

  private

  def generate_slug
    if title.present? && slug.blank?
      slug = title.underscore.parameterize(separator: "_").tr("_", "-")
      (Page.where.not(id: id).where(slug: slug).count > 0) ? slug += "-#{SecureRandom.hex(1)}" : slug
      self.slug = slug
    end
  end
end
