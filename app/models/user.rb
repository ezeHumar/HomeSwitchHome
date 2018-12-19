class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hotsales
  has_many :reservations
  has_many :auctions
  has_many :offers

  has_many :AnnualPayments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :birth_date, :expiration_credit_card, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :name, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :last_name, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :credit_card, length: { is: 16 }
  validates :cvv, length: { is: 3 }
  validate :age_mayor_18_anios
  validate :fecha_futura, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   private

   def age_mayor_18_anios
      if birth_date.nil? || birth_date > Date.today - 18.years
        errors.add(:birth_date, "Debes ser mayor de 18 años")
      end
    end

    def fecha_futura
       if expiration_credit_card.nil? || expiration_credit_card < Date.today
         errors.add(:expiration_credit_card, "La fecha de vencimiento de la tarjeta de crédito debe ser una fecha futura")
       end
     end
end
