class User < ApplicationRecord
  include Clearance::User

  validates :first_name, presence: true,
  		length: {minimum: 1}
  validates :last_name, presence: true,
		length: {minimum: 1}
  validates :birthday, presence: true
  validates :country, presence: true
  validates :age,numericality: {greater_than: 18, message: "must be greater than 18 years old to create account" }


  def age
	    now = Date.today
	    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
	    return age
	end
end
