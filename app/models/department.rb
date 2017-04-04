class Department < ApplicationRecord
  has_many :users

  def todos
    users.map(&:todos)
  end
end
