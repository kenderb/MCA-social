class User < ApplicationRecord
  has_attached_file :photo, styles: { medium: "250x250>", thumb: "50x50#" }, default_url: "default_photo.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_attached_file :cover_image, styles: { medium: "923x300>" }, default_url: "default_cover.jpg"
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\z/

  validates_uniqueness_of :username, case_sensitive: false, message: 'has already been taken'
  validates :username, length: { minimum: 4, too_short: 'Name too short' }
  validates :fullname, length: { minimum: 6, maximum: 20, too_short: 'Full name has to be longer'}
  validates_presence_of :username, message: "can't be blank"
  validates_presence_of :fullname, message: "can't be blank"

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :followings, foreign_key: 'follower_id', dependent: :destroy
  has_many :follows, through: :followings, source: :followed
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :inverse_followings
  has_many :likes, dependent: :destroy
  def friends_not_following
    User.where.not(id: follows).where.not(id: id).order('created_at DESC')
  end
end
