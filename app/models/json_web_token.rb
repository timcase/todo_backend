class JsonWebToken
  class << self
    def encode(payload, expiration = nil)
      payload = payload.dup
      payload['exp'] = expiration

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
