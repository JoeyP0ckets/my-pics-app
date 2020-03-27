class SessionsController < ApplicationController

    def new
    end 

    def create
        
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:success] = "Woot Woot! You Did It!"
            redirect_to user_path(@user)
        else 
            flash[:warning] = "OOPS! Try Again"
            redirect_to '/login'
        end 
    end 

    def destroy
        session.delete :user_id
        flash[:success] = "You Logged Out"
        redirect_to '/login'
    end 
end 