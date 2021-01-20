class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} #全角入力必須
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} #全角入力必須
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/} #全角カナ入力必須
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/} #全角カナ入力必須
  validates :birth_day, presence: true
  validates :password, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/} #半角英数混合
end
