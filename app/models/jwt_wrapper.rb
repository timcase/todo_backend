class JWTWrapper
  class << self
    def encode(user, expiration = nil)
      payload = user.to_token_payload
      payload[:exp] = expiration

      JWT.encode payload, Rails.application.secrets.jwt_secret
    end

    def decode(token)
      begin
        decoded_token = JWT.decode token, Rails.application.secrets.jwt_secret

        decoded_token.first
      rescue
        nil
      end
    end
  end
end
