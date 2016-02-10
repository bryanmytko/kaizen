class Entry < ActiveRecord::Base
  belongs_to :activity

  validates :activity,
    presence: true
end
