class UsersController < ApplicationController

    
    def show
        @user = User.find(params[:id])
        @picture = Picture.new
    end 
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
                @user.save
                session[:user_id] = @user.id
                flash[:success] = "Don't Stop Get it Get it!"
                redirect_to user_path(@user)
            else 
                flash[:warning] = "Ya Dun Goofed..."
                render :new
            end 
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end 
