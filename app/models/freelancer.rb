class Freelancer < ApplicationRecord
  has_many :proposals, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_one :freelancer_profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
