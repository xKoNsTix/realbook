class UsersController < ApplicationController

    before_action :require_signin, except: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(params.require(:user).permit(:name, :email, :password, :password_confirmation))
        if @user.save
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id]).destroy
        session[:user_id] = nil
        redirect_to events_url, status: :see_other
    end

    def require_correct_user
        @user = User.find(params[:id])
        redirect_to events_url unless current_user?(@user)
    end
end
