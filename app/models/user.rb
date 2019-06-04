class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, require: true
  validates :api_key, presence: true, uniqueness: true

  has_many :favorites
end
