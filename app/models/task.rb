class Task < ActiveRecord::Base
  scope :uncompleted, -> { where :complete => false }
  scope :nextaction, -> { where :next_flg => true }
  belongs_to :user
end