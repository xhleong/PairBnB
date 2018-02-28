class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, AvatarUploader

  validates :email, :uniqueness=> true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "error"}
  validates :first_name, presence: true,
  		length: {minimum: 1}
  validates :last_name, presence: true,
		length: {minimum: 1}
  validates :birthday, presence: true
  validates :country, presence: true
  validates :age,numericality: {greater_than: 17, message: "must be 18 years old or above to create account" }

  has_many :authentications, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def self.create_with_auth_and_hash(authentication, auth_hash)
	  user = self.create!(
	  first_name: auth_hash["info"]["first_name"],
	  last_name: auth_hash["info"]["last_name"],
	  email: auth_hash["extra"]["raw_info"]["email"],
	  gender: auth_hash["extra"]["raw_info"]["gender"],
	  birthday: auth_hash["extra"]["raw_info"]["birthday"],
	  country: auth_hash["info"]["location"].split(", ")[1],
	  password: 'fb'
	  )
	  user.authentications << authentication
	  return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
	  x = self.authentications.find_by(provider: 'facebook')
	  return x.token unless x.nil?
  end


  def age

	    now = Date.today
	    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
	    return age

	end
end
