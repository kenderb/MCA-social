class User < ApplicationRecord
  has_attached_file :photo, styles: { thumb: '60x60#', medium: "150x150>", large: '250x250' }
  validates_attachment_content_type :photo, content_type: %r{\Aimage/.*\z}

  has_attached_file :cover_image, styles: { large: '800x300>' }
  validates_attachment_content_type :cover_image, content_type: %r{\Aimage/.*\z}

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :followings, foreign_key: 'follower_id', dependent: :destroy
  has_many :follows, through: :followings, source: :followed
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :inverse_followings
end
