class Listing < ApplicationRecord
  mount_uploader :gallery, GalleryUploader

  belongs_to :user

  has_many :reservations, dependent: :destroy

  validates :name, presence:true
  validates :property_type, presence:true
  validates :address, presence:true
  validates :city, presence:true
  validates :postcode, presence:true
  validates :state, presence:true
  validates :country, presence:true
  validates :price, presence:true
  
  # validates :price_before_type_cast, presence:true
  # validates_format_of :price_before_type_cast, with: /^[0-9]\.?[0-9]{0,2}$/, message: "Please enter a valid number", on: [:save, :create, :update]
  # validates :price_before_type_cast, numericality: {greater_than: 0, message: "Please enter a valid price"}
 
  # validates_format_of :room_number_before_type_cast, with: /^[0-9]*$/, message: "Please enter a valid number", on: [:new, :save, :create, :update]
  # validates :room_number_before_type_cast, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "Please enter a valid number"}
  
  # validates_format_of :bed_number_before_type_cast, with: /^[0-9]*$/, message: "Please enter a valid number", on: [:new, :save, :create, :update]
  # validates :bed_number_before_type_cast, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "Please enter a valid number"}
  
  # validates_format_of :guest_number_before_type_cast, with: /^[0-9]*$/, message: "Please enter a valid number", on: [:new, :save, :create, :update]
  # validates :guest_number_before_type_cast, numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "Please enter a valid number"}

end
