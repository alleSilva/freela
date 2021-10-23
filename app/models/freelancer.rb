class Freelancer < ApplicationRecord
  has_many :proposals
  has_many :projects
  has_one :freelancer_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
