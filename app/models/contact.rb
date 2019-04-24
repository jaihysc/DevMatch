class Contact < ActiveRecord::Base
  #Populating the properties is unnecessary as rails has 200 IQ AND CAN DO IT BY ITSELF,
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end