class Task < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :users, through: :todos
end
