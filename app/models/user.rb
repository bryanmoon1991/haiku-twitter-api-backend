class User < ApplicationRecord
    has_secure_password
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship'
    has_many :followees, through: :followed_users
    
    has_many :following_users, foreign_key: :followee_id, class_name: 'Relationship'
    has_many :followers, through: :following_users

    has_many :favorites
    has_many :haikus
    # has_many :haikus, through: :favorites


    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end