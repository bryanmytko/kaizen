class User < ActiveRecord::Base
  has_many :activities

  has_secure_password

  validates :password, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def self.password_match
    self.password
  end
end
