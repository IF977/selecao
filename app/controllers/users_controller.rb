class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		authorize! :index, @user, :message => 'Permissão negada!.'
		@users = User.all
	end
	
	def show
		authorize! :read, @user, :message => 'Permissão negada!.'
		@user = User.find(params[:id])
	end
	
	def edit
		authorize! :update, @user, :message => 'Permissão negada!.'
		@user = User.find(params[:id])
	end

	def update
		authorize! :update, @user, :message => 'Permissão negada!.'
		user = User.find(params[:id])
		if user.update(user_params)
			redirect_to users_path, :notice => "Usuário alterado."
		else
			redirect_to users_path, :alert => "Não foi possível alterar o usuário."
		end
	end

	def destroy
		authorize! :destroy, @user, :message => 'Permissão negada!.'
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