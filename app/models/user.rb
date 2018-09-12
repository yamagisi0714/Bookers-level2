class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # deviseで利用する機能が記述されています
  validates :name,
	  uniqueness: { case_sensitive: :false },
	  length: { minimum: 2, maximum: 20 }
  has_many :users
end
