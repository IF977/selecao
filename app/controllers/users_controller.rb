

class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		authorize! :index, @user, :message => 'Not authorized as an administrator.'
		@users = User.all
	end
	
	def show
		authorize! :read, @user, :message => 'Not authorized as an administrator.'
		@user = User.find(params[:id])
	end
	
	def edit
		authorize! :update, @user, :message => 'Not authorized as an administrator.'
		@user = User.find(params[:id])
	end
	
	def update
		authorize! :update, @user, :message => 'Not authorized as an administrator.'
		user = User.find(params[:id])
		print("USER: " + user.to_s)
		print("USER_PARAMS: " + user_params.to_s)
		if user.update(user_params)
			redirect_to users_path, :notice => "User updated."
		else
			redirect_to users_path, :alert => "Unable to update user."
		end
	end

	

	def destroy
		authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
		user = User.find(params[:id])
		unless user == current_user
			user.destroy
			redirect_to users_path, :notice => "User deleted."
		else
			redirect_to users_path, :notice => "Can't delete yourself."
		end
	end

	private

	    def set_user
	      @user = User.find(params[:id])
	    end

	    def user_params
	      params.require(:user).permit(:nome, :email, {:role_ids => []})
	    end
end