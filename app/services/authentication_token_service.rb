class AuthenticationTokenService
  HMAC_SECRET = "b70df76ea3a9fb4b30c259fad41e3590"
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(user_id)
    exp = 24.hours.from_now.to_i
    payload = { user_id: user_id, exp: exp }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
  rescue JWT::DecodeError
    false
  end

  def self.valid_payload(payload)
    !expired(payload)
  end

  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end

  def self.expired_token
    render json: { error: 'Токен застарів, увійдіть знову' }, status: :unauthorized
  end
end
