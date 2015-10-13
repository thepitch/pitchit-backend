class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :external_links, as: :linkable
  has_many :pitches
  has_many :votes
  has_many :comments
  has_many :subcomments

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :blurb, length: { maximum: 300 }

  def full_name
    self.first_name + " " + self.last_name
  end

end
