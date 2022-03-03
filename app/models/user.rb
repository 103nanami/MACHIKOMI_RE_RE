class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :posts, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :column_favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :image

  def active_for_authentication?
    super && (is_active == true)
  end

  def self.search(search)
    if search
      User.where(['last_name LIKE ?', "%#{search}%"]).or(User.where(['first_name LIKE ?', "%#{search}%"]))
    else
      User.all
    end
  end

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :username, presence: true
  validates :sex, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :old, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :password, presence: true



end
