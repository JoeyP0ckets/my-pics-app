class CommentsController < ApplicationController

    def index
        @comments = Comments.all
    end

    def show
        @comment = Comment.find(params[:id])
    end 
    
    def new
        @comment = Comment.new
    end 

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to comment_path(@comment)
        else
            render :new
    end



    private

    def comment_params
        params.permit(:content)
    end 

end 