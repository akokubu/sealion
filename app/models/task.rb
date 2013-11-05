class Task < ActiveRecord::Base
  scope :uncompleted, -> { where :complete => false }
end