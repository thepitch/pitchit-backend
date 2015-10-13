class Pitch < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :external_links, as: :linkable
  has_many :votes, as: :votable

  validates :title, length: { maximum: 50 }
  validates :tagline, length: { maximum: 140 }
  validates :description, length: { maximum: 3000 }

  GRAVITY = 1.1

  attr_accessor :num_votes

  def score
    self.votes.count / ((age/3600) + 2)**GRAVITY
  end

  def age
    Time.now - self.created_at
  end

  def video
    video = self.media
    video.gsub!("watch?v=", "embed/")
    return video
  end

  def self.best_pitches_since(cutoff_time)
    self.all.sort do |p1, p2|
      p2.score <=> p1.score
      self.joins(:votes).where("created_at >= ?", Time.zone.now.beginning_of_day).group("votable_id").order("count(votes.id) DESC")

    end
  end

  def self.sort_pitches(sort_type)
    if sort_type == "new"
      Pitch.order(created_at: :DESC)
    elsif sort_type == "top"
      Pitch.joins(:votes).group("votable_id").order("count(votes.id) DESC")
    elsif sort_type == "most_discussed"
      Pitch.joins(:comments).group("pitch_id").order("count(comments.id) DESC")
    else
      Pitch.all.sort { |p1, p2| p2.score <=> p1.score }
    end
  end
end
