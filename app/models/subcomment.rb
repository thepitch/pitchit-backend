class Subcomment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  validates :content, length: { maximum: 1500 }
  validates :user, :comment, :content, presence: true
end
