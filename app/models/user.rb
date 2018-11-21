class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, length: { minimum:6 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
