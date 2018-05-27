class ApplicationController < ActionController::API
  def authorize
    header = request.headers['Authorization']
    auth_token = header.split(' ')[1]
    begin
      decoded_token = JsonWebToken.decode(auth_token)
      if decoded_token[:exp] > Time.now.to_i
        { :authorized => true, :user_id => decoded_token[:user_id] }
      else
        { :authorized => false, :message => 'token expired' }
      end
    rescue
      { :authorized => false, :message => 'invalid token' }
    end
  end
end
