class User < ApplicationRecord

    has_many :pictures
    has_many :comments
    has_many :pictures, through: :comments
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, uniqueness: true

    # def user_pictures               
    #     Picture.where("user_id = #{self.id}")
    # end

    # def all_pictures
    #     Picture.all
    # end

end
