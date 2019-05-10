class User < ApplicationRecord
  serialize :friend, Array

  has_many :rooms
  has_many :requests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

enum role: [:student,:teacher]


end
