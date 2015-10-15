require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

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

    # users.password_hash in the database is a :string

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
