class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_day
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do # 全角入力必須
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do # 全角カナ入力必須
    validates :last_name_kana
    validates :first_name_kana
  end
  # validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # 半角英数混合

  has_many :items
  has_many :purchases
end
