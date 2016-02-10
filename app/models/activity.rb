class Activity < ActiveRecord::Base
  has_many :entries

  validates :title, :description,
    presence: true
end
