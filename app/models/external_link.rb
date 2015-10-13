class ExternalLink < ActiveRecord::Base
  belongs_to :linkable, polymorphic: true

  validates :url, :linkable, presence: true
end
