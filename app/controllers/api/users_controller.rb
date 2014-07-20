class Api::UsersController < ApplicationController

	def root
	end

	def index
		@users = User.all
		render :json => @users.to_json(:methods => [:avatar_url_large, :avatar_url_medium])
	end

	def show
		@user = User.find(params[:id])
		render :json => @user.to_json(:methods => [:avatar_url_large, :avatar_url_medium])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render :json => @user
		else
			render :json => {
				message: 'User Creation Failed',
				errors: @user.errors.full_messages
			}, status: 422
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render :json => @user
		else
			render :json => {
				message: 'User Update Failed',
				errors: @user.errors.full_messages
			}, status: 422
		end
	end

	private

	def user_params
		# params.require(:user).permit(:avatar, :username, :fname, :uupc, :description)
		{
			avatar: params[:avatar],
			username: params[:username],
			fname: params[:fname],
			uupc: params[:uupc],
			description: params[:description]
		}
	end

end