# Your actual JWT Strategy
# "config/initializers/core_extensions/devise/strategies/json_web_token.rb"

module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        byebug
        return fail! unless claims
        return fail! unless claims.has_key?('sub')

        success! User.find_by_id claims['sub']
      end

      protected ######################## PROTECTED #############################

      def claims
        strategy, token = request.headers['Authorization'].split(' ')

        return nil if (strategy || '').downcase != 'bearer'

        JWTWrapper.decode(token) rescue nil
      end
    end
  end
end
