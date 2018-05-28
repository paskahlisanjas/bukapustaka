class UserController < ApplicationController
  def register
    User.create!({
      :name => params[:name],
      :email => params[:email],
      :password => params[:password]
    })
    auth_token = AuthenticateUser.new(params[:email], params[:password]).call
    render :json => { auth_token: auth_token }, :status => :ok
  end
end
