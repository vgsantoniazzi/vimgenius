class Level < ActiveRecord::Base
  belongs_to :lesson
  has_many :commands
  validates :name, presence: true
  validates :sequence_number, presence: true
  before_save :create_slug

  def to_param
    slug
  end

  def self.find_by_slug(slug)
    where(slug: slug).first
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end

end
