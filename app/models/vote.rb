class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user, :votable, presence: true
  validates :bookmarked, inclusion: { within: [true, false] }
end
