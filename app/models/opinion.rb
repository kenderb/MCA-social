class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates_presence_of :text, :movie_name
  validates :text, length: { minimum: 10, maximum: 120, message: 'Opinion minmun of 10 maximun of 120.' }
  validates :movie_name, length: { minimum: 2, maximum: 30, message: 'movie_name minmun of 2 maximun of 30.' }
  has_many :likes, dependent: :destroy

  scope :ordered_by_most_recent, -> { includes(:author, :likes).order(created_at: :desc) }

  def self.count_opinion
    ordered_by_most_recent.length
  end
end
