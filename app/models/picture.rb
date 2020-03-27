class Picture < ApplicationRecord

    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    has_many :picture_tags
    has_many :tags, through: :picture_tags

    accepts_nested_attributes_for :tags

    def tags_attributes=(tag_attributes)
        tag_attributes.values.each do |tag_attribute|
          tag = Tag.find_or_create_by(tag_attribute)
          self.tags << tag
        end
      end

    
    def self.get_all_pics_by_tag_id(tag_id) 
        PictureTag.where("tag_id = #{tag_id}")
    end

    def self.get_all_pictures_sorted_by_most_recent
        
    end

    def self.pictures_total
       Picture.all.count 
    end
end
    
    
    
    
    
    
    
    # def user_name=(username)      #<-- PELHAM
    #     self.user = User.find_or_create_by(name: username)  
    # end 

    # def user_name
    #     user.try(:username)  
    # end 
# end
