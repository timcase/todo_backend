class User < ApplicationRecord
  has_secure_password
  has_many :todos
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  def to_token_payload
    {sub: self.id, user_name: self.email}
  end

  def jwt
    Knock::AuthToken.new(payload: self.to_token_payload).token
  end

  def generate_json_api_error
    json_error = {"errors": []}
    errors.messages.each do |err_type, messages|
      messages.each do |msg|
        json_error[:errors] << {"detail": "#{err_type} #{msg}", "source": {"pointer": "user/err_type"}}
      end
    end
    json_error
  end
end
