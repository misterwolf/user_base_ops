class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :timeoutable

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, unless: "password.nil?"
  validates :password, presence: true, if: "id.nil?"
  validates_confirmation_of :password


end
