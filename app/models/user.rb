class User < ApplicationRecord
  has_many :posts
  validates :user_name, presence: true, length: { minimum: 4, maximum: 12 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
