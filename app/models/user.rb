class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, length: { minimum: 6 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :cvv, length: { is: 3 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
