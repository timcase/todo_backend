class User < ApplicationRecord
  has_secure_password
  belongs_to :departments
  has_many :todos

  def to_token_payload
    {sub: self.id, user_name: self.email}
  end
end
