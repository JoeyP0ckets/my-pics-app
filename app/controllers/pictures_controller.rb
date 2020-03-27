class PicturesController < ApplicationController

    def index
        @pictures = Picture.all
    end 

    def show
        @picture = Picture.find(params[:id])
    end

    def new
        @picture = Picture.new
    end 

    def create
    
        @picture = Picture.new(picture_params)
        @tag = Tag.new(name: picture_params[:tags_attributes]["0"][:name])
        @picture.tags << @tag
        current_user.pictures << @picture
        if @picture.save
           redirect_to picture_path(@picture)    
        else 
            render :new
        end 
    end 

    private

    def picture_params
        params.require(:picture).permit(:image_url, :title, :user_id, :tag_ids =>[], tags_attributes: [:name])   
    end
end 


