class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :api_keys

  def generate_api_key
    api_keys.live_keys.each { |api_key| api_key.expire }
    api_keys.create
  end

end
