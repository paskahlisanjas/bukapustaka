class AuthController < ApplicationController

  # require 'bcrypt'
  # require 'date'
  #
  # def login
  #   begin
  #     @user = User.where(username: params[:username]).first
  #     if BCrypt::Password.new(@user.password) == params[:password]
  #       @token = BCrypt::Password.create(@user.username + DateTime.now.strftime("%d/%m/%Y-%H:%M:%S"))
  #       Token.create!({
  #         :user => @user.id,
  #         :token => @token
  #       })
  #       render :json => { token: @token }, status: :ok
  #     else
  #       render :json => { :message => 'Invalid password' }, status: :ok
  #     end
  #   rescue ActiveRecord::RecordNotFound
  #     render json: { message: 'user doesn\'t exist' }, status: 404
  #   end
  # end
  #
  # def logout
  #   Token.where(token: params[:token]).destroy_all
  #   render :json => { message: 'logged out successfully'}, status: :ok
  # end
  #
  # def auth
  #   begin
  #     @token = Token.where(token: params[:token]).first
  #     raise ActiveRecord::RecordNotFound.new if @token == nil
  #
  #     @user = User.find(@token.user)
  #     render :json => @user, status: :ok
  #   rescure ActiveRecord::RecordNotFound
  #     render json: { message: 'request is not authenticated' }, status: 401
  #   end
  # end

end
