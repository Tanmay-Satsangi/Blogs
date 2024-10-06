class ApplicationController < ActionController::API
  before_action :authorized
  
  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def decode_token
    header = request.headers["Authorization"]

    if header
      token = header.split(" ")[1]

      begin
        JWT.decode(token, Rails.application.secret_key_base)
      rescue JWT::DecodeError
        nil
      end
    else
    end
  end

  def current_user
    if decode_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorized
    unless !!current_user
      render json: { message: "Please log in" }, status: :unauthorized
    end
  end
end
