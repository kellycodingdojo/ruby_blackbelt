class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :joins



   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :password, :password_confirmation, :presence => true, on: [:create]
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, on: [:create]

  before_save :downcase_email

  private
  def downcase_email
    email.downcase! if email.present?
  end
end
 