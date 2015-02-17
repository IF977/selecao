class UsersController < ApplicationController
	load_and_authorize_resource
	before_filter :authenticate_user!

	def index
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		if user_params['role_ids'].include? '1' 
			if user_params['role_ids'].include? '2'
				redirect_to users_path, :alert => "Um usuário não pode ser admin e avaliador ao mesmo tempo."
			end
		elsif @user.update(user_params)
			redirect_to users_path, :notice => "Usuário alterado."
		else
			redirect_to users_path, :alert => "Não foi possível alterar o usuário."
		end
	end

	def destroy
	    user = User.find(params[:id])
	    user.destroy
	    redirect_to users_path, :notice => "Usuário removido."
	  end

	private

	    def set_user
	      @user = User.find(params[:id])
	    end

	    def user_params
	      params.require(:user).permit(:email, {:role_ids => []})
	    end
end