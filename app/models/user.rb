# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, class_name: 'PostComment', foreign_key: :user_id
  has_many :likes, dependent: :destroy, class_name: 'PostLike', foreign_key: :user_id
end
