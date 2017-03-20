class Todo < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :department
end
