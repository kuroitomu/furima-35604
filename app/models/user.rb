class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :order
  has_many :comments
  #has_many :purchase

  with_options presence: true do
      validates :nickname
      validates :email
      validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Password Include both letters and numbers"}

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} do
      validates :family_name_full_width
      validates :first_name_full_width
    end

  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_kana
      validates :first_name_kana
    end

      validates :birthday
   end
end
