 class AuthenticationController < ApplicationController
  def login
    auth_token = AuthenticateUser.new(params[:email], params[:password]).call
    render :json => { auth_token: auth_token }, :status => :ok
  end

  def authenticate
    header = request.headers['Authorization']
    auth_token = header.split(' ')[1]
    begin
      decoded_token = JsonWebToken.decode(auth_token)
      if decoded_token[:exp] > Time.now.to_i
        render :json => { :message => 'ok' }, :status => :ok
      else
        render :json => { :message => 'token expired' }, :status => :unauthorized
      end
    rescue
      render :json => { :message => 'request not authorized' }, :status => :unauthorized
    end
  end
end
