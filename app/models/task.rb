class Task < ActiveRecord::Base
  scope :uncompleted, -> { where :complete => false }
  belongs_to :user
end