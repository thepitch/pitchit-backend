class Comment < ActiveRecord::Base
  belongs_to :pitch
  belongs_to :user
  has_many :subcomments
  has_many :votes, as: :votable

  validates :content, length: { maximum: 1500 }
  validates :user, :pitch, :content, presence: true
end
