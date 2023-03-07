class Post < ApplicationRecord
  belongs_to :user

  enum post_type: [:happy, :sad, :angry, :funny]

  scope :sad_posts, -> { where(post_type: :sad) }

  scope :happy_posts, -> { where(post_type: :happy) }

end
