class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable,  :timeoutable


 mount_uploader :user_image_id, ImageUploader

 enum gender: [:男, :女]

 enum age: [:"19歳以下", :"20代", :"30代", :"40代", :"50代", :"60代", :"70代", :"80歳以上"]

end

