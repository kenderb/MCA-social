class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates_presence_of :text
  validates :text, length: { minimum: 10, maximum: 120 }

  scope :ordered_by_most_recent, -> { includes(:author, :likes).order(created_at: :desc) }
end
