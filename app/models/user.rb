class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tp_activities
  has_many :bookings
  has_many :trips
  #acts_as_voter
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone_number, :address, :avatar, :bio, :is_host
  attr_accessible :encrypted_password, :slug, :is_agency, :reset_password_token, :reset_password_sent_at, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  # attr_accessible :title, :body
  mount_uploader :avatar, UserAvatarUploader
end
